import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuaDiaDiemHoatDongScreen extends StatefulWidget {
  final Place? place;

  const SuaDiaDiemHoatDongScreen({super.key, this.place});

  @override
  State<SuaDiaDiemHoatDongScreen> createState() =>
      _SuaDiaDiemHoatDongScreenState();
}

class _SuaDiaDiemHoatDongScreenState extends State<SuaDiaDiemHoatDongScreen> {
  String? selectedProvince;
  final List<String> provinces = [
    'Hà Nội',
    'TP. Hồ Chí Minh',
    'Đà Nẵng',
    'Hải Phòng',
    'Cần Thơ',
    'An Giang',
    'Bà Rịa - Vũng Tàu',
    'Bắc Giang',
    'Bắc Kạn',
    'Bạc Liêu',
  ];

  late TextEditingController tenDiaDiemController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasSubmitted = false;
  late final DanhSachHoatDongCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = DanhSachHoatDongCubit();
    final place = widget.place;
    if (place != null) {
      tenDiaDiemController = TextEditingController(text: place.name);
      selectedProvince = place.province.name;
      _cubit.setPlaceSelected(place);
    } else {
      tenDiaDiemController = TextEditingController();
    }
  }

  @override
  void dispose() {
    tenDiaDiemController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;

    if (place == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Lỗi'),
          backgroundColor: AppColors.button,
        ),
        body: const Center(child: Text('Không tìm thấy dữ liệu hoạt động')),
      );
    }

    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<DanhSachHoatDongCubit, DanhSachHoatDongState>(
        listenWhen: (previous, current) {
          return !_hasSubmitted &&
              previous.status != DanhSachHoatDongStatus.success &&
              current.status == DanhSachHoatDongStatus.success;
        },
        listener: (context, state) {
          _hasSubmitted = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cập nhật hoạt động thành công')),
          );
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Sửa Hoạt Động',
              style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: AppColors.button,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete, color: AppColors.white),
                onPressed: () => _showDeleteDialog(),
              ),
            ],
          ),
          backgroundColor: AppColors.white,
          body: Form(
            key: _formKey,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextInput(
                      labelText: "Tên địa điểm hoạt động",
                      hintText: "Nhập địa điểm hoạt động",
                      controller: tenDiaDiemController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập tên địa điểm';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    DropDownWidget<String>(
                      title: 'Tỉnh/Thành phố',
                      options: provinces,
                      itemToString: (province) => province,
                      value: selectedProvince,
                      onChanged: (province) {
                        setState(() {
                          selectedProvince = province;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Vui lòng chọn tỉnh/thành phố';
                        }
                        return null;
                      },
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16, right: 8),
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary
                                    .withOpacity(0.3),
                                foregroundColor: AppColors.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Hủy',
                                style: TextStyle(
                                  fontSize: AppFonts.fontSize16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16, left: 8),
                            height: 48,
                            child: BlocBuilder<
                              DanhSachHoatDongCubit,
                              DanhSachHoatDongState
                            >(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed:
                                      state.status ==
                                              DanhSachHoatDongStatus.loading
                                          ? null
                                          : () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              print(
                                                'Sửa hoạt động: ${place.name}',
                                              );
                                              print(
                                                'selectedPlace: ${_cubit.state.selectedPlace?.name}',
                                              );
                                              _cubit.suaHoatDong(
                                                tenDiaDiemController.text,
                                                selectedProvince!,
                                              );
                                            }
                                          },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.button,
                                    foregroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child:
                                      state.status ==
                                              DanhSachHoatDongStatus.loading
                                          ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: AppColors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                          : const Text(
                                            'Lưu',
                                            style: TextStyle(
                                              fontSize: AppFonts.fontSize16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog() {
    final place = widget.place;
    if (place == null) return;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Xác nhận xóa'),
            content: Text('Bạn có chắc chắn muốn xóa "${place.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Hủy'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _cubit.setPlaceSelected(place);
                  _cubit.xoaHoatDong();
                  Navigator.pop(context);
                },
                child: const Text('Xóa', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }
}
