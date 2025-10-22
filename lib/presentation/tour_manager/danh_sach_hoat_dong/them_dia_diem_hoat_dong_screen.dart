import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/danh_sach_hoat_dong_state.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/dropdown_widget.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemDiaDiemHoatDongScreen extends StatefulWidget {
  const ThemDiaDiemHoatDongScreen({super.key});

  @override
  State<ThemDiaDiemHoatDongScreen> createState() =>
      _ThemDiaDiemHoatDongScreenState();
}

class _ThemDiaDiemHoatDongScreenState extends State<ThemDiaDiemHoatDongScreen> {
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

  final TextEditingController tenDiaDiemController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _hasSubmitted = false;

  @override
  void dispose() {
    tenDiaDiemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DanhSachHoatDongCubit, DanhSachHoatDongState>(
      listenWhen: (previous, current) {
        return !_hasSubmitted &&
            previous.status != DanhSachHoatDongStatus.success &&
            current.status == DanhSachHoatDongStatus.success;
      },
      listener: (context, state) {
        _hasSubmitted = true;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thêm hoạt động thành công')),
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
            'Thêm Địa Điểm Hoạt Động',
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.button,
          centerTitle: true,
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
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 48,
                    child: BlocBuilder<
                      DanhSachHoatDongCubit,
                      DanhSachHoatDongState
                    >(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed:
                              state.status == DanhSachHoatDongStatus.loading
                                  ? null
                                  : () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context
                                          .read<DanhSachHoatDongCubit>()
                                          .themHoatDong(
                                            tenDiaDiemController.text,
                                            selectedProvince!,
                                          );
                                    }
                                  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.button,
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child:
                              state.status == DanhSachHoatDongStatus.loading
                                  ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : const Text(
                                    'Thêm',
                                    style: TextStyle(
                                      fontSize: AppFonts.fontSize16,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
