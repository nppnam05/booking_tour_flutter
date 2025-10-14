import 'package:flutter_bloc/flutter_bloc.dart';

import 'select_dialog_state.dart';

enum SelectMode { single, multiple }

class SelectCubit extends Cubit<SelectState> {
  SelectCubit({
    required String title,
    required List<String> options,
    required SelectMode mode,
    List<String> initialSelected = const [],
  }) : super(
         SelectState(
           title: title,
           allOptions: options,
           filteredOptions: options,
           selected: initialSelected,
           mode: mode,
         ),
       );

  void updateSearch(String text) {
    final filtered =
        state.allOptions
            .where((e) => e.toLowerCase().contains(text.toLowerCase()))
            .toList();
    emit(state.copyWith(searchText: text, filteredOptions: filtered));
  }

  void clearSearch() => updateSearch('');

  void toggleItem(String item) {
    final newSelected = List<String>.from(state.selected);
    if (state.mode == SelectMode.single) {
      newSelected
        ..clear()
        ..add(item);
    } else {
      if (newSelected.contains(item)) {
        newSelected.remove(item);
      } else {
        newSelected.add(item);
      }
    }
    emit(state.copyWith(selected: newSelected));
  }
}
