import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/them_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/them_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/sua_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/sua_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionDialog<T> extends StatefulWidget {
  final List<T> allItems;
  final List<T> selectedItems;
  final Function(List<T>) onItemsChanged;
  final String Function(T) itemDisplayText;
  final String Function(T)? itemSearchText;
  final String title;
  final String searchHint;
  final dynamic cubit;

  const SelectionDialog({
    super.key,
    required this.allItems,
    required this.selectedItems,
    required this.onItemsChanged,
    required this.itemDisplayText,
    required this.title,
    required this.searchHint,
    this.itemSearchText,
    this.cubit,
  });

  @override
  State<SelectionDialog<T>> createState() => _SelectionDialogState<T>();
}

class _SelectionDialogState<T> extends State<SelectionDialog<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<T> _tempSelectedItems = [];

  @override
  void initState() {
    super.initState();
    _tempSelectedItems = List.from(widget.selectedItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleItem(T item) {
    setState(() {
      final index = _tempSelectedItems.indexWhere(
        (selectedItem) => _getItemId(selectedItem) == _getItemId(item),
      );

      if (index != -1) {
        _tempSelectedItems.removeAt(index);
      } else {
        _tempSelectedItems.add(item);
      }
    });
  }

  dynamic _getItemId(T item) {
    if (item is Map<String, dynamic>) {
      return item['id'];
    } else {
      try {
        return (item as dynamic).id;
      } catch (e) {
        return item.toString();
      }
    }
  }

  void _confirmSelection() {
    widget.onItemsChanged(_tempSelectedItems);
    Navigator.pop(context);
  }

  Widget _buildItemsListWithCubit() {
    if (widget.cubit != null) {
      if (widget.cubit is ThemHoatDongCubit) {
        return BlocBuilder<ThemHoatDongCubit, ThemHoatDongState>(
          bloc: widget.cubit as ThemHoatDongCubit,
          builder: (context, state) {
            return _buildItemsList(state.filteredActivities.cast<T>());
          },
        );
      } else if (widget.cubit is SuaHoatDongCubit) {
        return BlocBuilder<SuaHoatDongCubit, SuaHoatDongState>(
          bloc: widget.cubit as SuaHoatDongCubit,
          builder: (context, state) {
            return _buildItemsList(state.filteredActivities.cast<T>());
          },
        );
      }
    }
    return _buildItemsList(widget.allItems);
  }

  Widget _buildItemsList(List<T> items) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          'Không có mục nào',
          style: TextStyle(
            fontSize: AppFonts.fontSize16,
            color: AppColors.secondary,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = _tempSelectedItems.any(
          (selectedItem) => _getItemId(selectedItem) == _getItemId(item),
        );

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isSelected
                      ? AppColors.button
                      : AppColors.secondary.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(8),
            color:
                isSelected
                    ? AppColors.button.withOpacity(0.1)
                    : AppColors.white,
          ),
          child: ListTile(
            title: Text(
              widget.itemDisplayText(item),
              style: TextStyle(
                color: isSelected ? AppColors.button : AppColors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            trailing:
                isSelected
                    ? const Icon(Icons.check_circle, color: AppColors.button)
                    : const Icon(
                      Icons.radio_button_unchecked,
                      color: AppColors.secondary,
                    ),
            onTap: () => _toggleItem(item),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: AppFonts.fontSize18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(height: 1, color: AppColors.secondary),
                ],
              ),
            ),

            SearchBarWidget(
              hintText: widget.searchHint,
              controller: _searchController,
              onChanged: (query) {
                if (widget.cubit != null) {
                  if (widget.cubit is ThemHoatDongCubit) {
                    (widget.cubit as ThemHoatDongCubit).searchActivities(query);
                  } else if (widget.cubit is SuaHoatDongCubit) {
                    (widget.cubit as SuaHoatDongCubit).searchActivities(query);
                  }
                }
              },
              onClear: () {
                _searchController.clear();
                if (widget.cubit != null) {
                  if (widget.cubit is ThemHoatDongCubit) {
                    (widget.cubit as ThemHoatDongCubit).clearSearch();
                  } else if (widget.cubit is SuaHoatDongCubit) {
                    (widget.cubit as SuaHoatDongCubit).clearSearch();
                  }
                }
              },
            ),
            const SizedBox(height: 16),

            // Items list
            Expanded(child: _buildItemsListWithCubit()),

            const SizedBox(height: 16),

            Column(
              children: [
                Container(height: 1, color: AppColors.secondary),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Hủy'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _confirmSelection,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Chọn'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
