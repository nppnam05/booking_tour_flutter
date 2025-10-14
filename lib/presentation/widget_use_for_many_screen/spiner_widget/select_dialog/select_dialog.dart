import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/select_dialog/select_dialog_cubit.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/spiner_widget/select_dialog/select_dialog_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';

class SelectDialog extends StatefulWidget {
  final String title;
  final List<String> options;
  final SelectMode mode;
  final List<String> initialSelected;

  const SelectDialog({
    super.key,
    required this.title,
    required this.options,
    this.mode = SelectMode.single,
    this.initialSelected = const [],
  });

  @override
  State<SelectDialog> createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => SelectCubit(
            title: widget.title,
            options: widget.options,
            mode: widget.mode,
            initialSelected: widget.initialSelected,
          ),
      child: BlocBuilder<SelectCubit, SelectState>(
        builder: (context, state) {
          final cubit = context.read<SelectCubit>();

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text(
              'Chọn ${state.title}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 340,
              child: Column(
                children: [
                  SearchBarWidget(
                    controller: _searchController,
                    hintText: 'Tìm ${state.title.toLowerCase()}',
                    onChanged: cubit.updateSearch,
                    onClear: cubit.clearSearch,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.filteredOptions.length,
                      itemBuilder: (context, index) {
                        final item = state.filteredOptions[index];
                        final selected = state.selected.contains(item);
                        return ListTile(
                          title: Text(item),
                          trailing:
                              selected
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : null,
                          onTap: () {
                            cubit.toggleItem(item);
                            if (widget.mode == SelectMode.single) {
                              Navigator.pop(context, [item]);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (widget.mode == SelectMode.multiple)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed:
                              () => Navigator.pop(context, state.selected),
                          child: const Text('Xác nhận'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed:
                              () => Navigator.pop(
                                context,
                                widget.initialSelected,
                              ),
                          child: const Text('Hủy'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
