import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/select_dialog/select_dialog_cubit.dart';
import 'package:equatable/equatable.dart';

class SelectState extends Equatable {
  final String title;
  final List<String> allOptions;
  final List<String> filteredOptions;
  final List<String> selected;
  final String searchText;
  final SelectMode mode;

  const SelectState({
    this.title = '',
    this.allOptions = const [],
    this.filteredOptions = const [],
    this.selected = const [],
    this.searchText = '',
    this.mode = SelectMode.single,
  });

  SelectState copyWith({
    String? title,
    List<String>? allOptions,
    List<String>? filteredOptions,
    List<String>? selected,
    String? searchText,
    SelectMode? mode,
  }) {
    return SelectState(
      title: title ?? this.title,
      allOptions: allOptions ?? this.allOptions,
      filteredOptions: filteredOptions ?? this.filteredOptions,
      selected: selected ?? this.selected,
      searchText: searchText ?? this.searchText,
      mode: mode ?? this.mode,
    );
  }

  @override
  List<Object?> get props => [
    title,
    allOptions,
    filteredOptions,
    selected,
    searchText,
    mode,
  ];
}
