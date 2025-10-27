import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/sua_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/sua_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/widget/multi_selector.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/widget/selection_dialog.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/text_input.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuaDiaDiemHoatDongScreen extends StatefulWidget {
  final LocationActivity? locationActivity;

  const SuaDiaDiemHoatDongScreen({super.key, this.locationActivity});

  @override
  State<SuaDiaDiemHoatDongScreen> createState() =>
      _SuaDiaDiemHoatDongScreenState();
}

class _SuaDiaDiemHoatDongScreenState extends State<SuaDiaDiemHoatDongScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tenDiaDiemController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Activity> _selectedActivities = [];
  late final SuaHoatDongCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SuaHoatDongCubit();
    _cubit.loadActivities();

    if (widget.locationActivity != null) {
      _tenDiaDiemController.text = widget.locationActivity!.name;
    }
  }

  @override
  void dispose() {
    _tenDiaDiemController.dispose();
    _focusNode.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<SuaHoatDongCubit, SuaHoatDongState>(
        listener: (context, state) {
          if (state.status) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cập nhật địa điểm hoạt động thành công'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context, true);
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Lỗi: ${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<SuaHoatDongCubit, SuaHoatDongState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text(
                  'Sửa Địa Điểm Hoạt Động',
                  style: TextStyle(color: AppColors.white),
                ),
                backgroundColor: AppColors.button,
                centerTitle: true,
              ),
              backgroundColor: AppColors.white,
              body: GestureDetector(
                onTap: () => _focusNode.unfocus(),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextInput(
                              controller: _tenDiaDiemController,
                              hintText: 'Nhập tên địa điểm',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập tên địa điểm';
                                }
                                return null;
                              },
                              labelText: 'Tên địa điểm hoạt động',
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Danh sách hoạt động',
                              style: TextStyle(
                                fontSize: AppFonts.fontSize16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            MultiSelector<Activity>(
                              selectedItems: _selectedActivities,
                              onItemsChanged: (activities) {
                                setState(() {
                                  _selectedActivities = activities;
                                });
                              },
                              itemDisplayText: (activity) => activity.action,
                              dialogBuilder: (
                                context,
                                selectedItems,
                                onItemsChanged,
                              ) {
                                return BlocProvider.value(
                                  value: _cubit,
                                  child: SelectionDialog<Activity>(
                                    allItems: state.activities,
                                    selectedItems: selectedItems,
                                    onItemsChanged: onItemsChanged,
                                    itemDisplayText:
                                        (activity) => activity.action,
                                    title: 'Chọn hoạt động',
                                    searchHint: 'Tìm kiếm hoạt động...',
                                  ),
                                );
                              },
                              hintText: 'Chọn các hoạt động',
                              enabled: true,
                            ),
                          ],
                        ),

                        Center(
                          child: BkButton(
                            onPressed: () => _handleUpdate(),
                            title: 'Cập nhật',
                            backgroundColor: AppColors.button,
                            textStyle: const TextStyle(
                              fontSize: AppFonts.fontSize16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleUpdate() {
    if (_formKey.currentState!.validate()) {
      if (_selectedActivities.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng chọn ít nhất một hoạt động'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final placeId = widget.locationActivity?.place.id ?? 1;
      _cubit.suaHoatDong(
        widget.locationActivity!.id,
        _tenDiaDiemController.text,
        placeId,
        _selectedActivities,
      );
    }
  }
}
