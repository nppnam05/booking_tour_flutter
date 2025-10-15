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
            backgroundColor: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Chọn ${state.title}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 400,
              child: Column(
                children: [
                  const Divider(height: 1, color: Colors.grey),
                  const SizedBox(height: 12),
                  SearchBarWidget(
                    controller: _searchController,
                    hintText: 'Tìm ${state.title.toLowerCase()}',
                    onChanged: cubit.updateSearch,
                    borderRadius: 8,
                    onClear: () {
                      _searchController.clear();
                      cubit.clearSearch();
                    },
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ClipRect(
                      clipBehavior: Clip.hardEdge,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        clipBehavior: Clip.hardEdge,
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.filteredOptions.length,
                        itemBuilder: (context, index) {
                          final item = state.filteredOptions[index];
                          final selected = state.selected.contains(item);
                          return Material(
                            color:
                                selected
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                cubit.toggleItem(item);
                                if (widget.mode == SelectMode.single) {
                                  Navigator.pop(context, [item]);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(item)),
                                    if (selected)
                                      const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (widget.mode == SelectMode.multiple) ...[
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Colors.grey),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed:
                                () => Navigator.pop(context, state.selected),
                            child: const Text('Xác nhận'),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                    ),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
