import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/them_hoat_dong_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/cubit/them_hoat_dong_state.dart';
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
  Province? selectedProvince;
  final TextEditingController tenDiaDiemController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final ThemHoatDongCubit _cubit;

  bool _hasSubmitted = false;

  @override
  void initState() {
    super.initState();
    _cubit = ThemHoatDongCubit();
    _cubit.loadProvinces();
  }

  @override
  void dispose() {
    tenDiaDiemController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<ThemHoatDongCubit, ThemHoatDongState>(
        listenWhen: (previous, current) {
          return !_hasSubmitted &&
              previous.status == ThemHoatDongStatus.loadingAdd &&
              current.status == ThemHoatDongStatus.success;
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
                    BlocBuilder<ThemHoatDongCubit, ThemHoatDongState>(
                      builder: (context, state) {
                        if (state.provinces.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return DropDownWidget<Province>(
                          title: 'Tỉnh/Thành phố',
                          options: state.provinces,
                          itemToString: (province) => province.name,
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
                        );
                      },
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 48,
                      child: BlocBuilder<ThemHoatDongCubit, ThemHoatDongState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state.status == ThemHoatDongStatus.loadingAdd
                                    ? null
                                    : () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        context
                                            .read<ThemHoatDongCubit>()
                                            .themHoatDong(
                                              tenDiaDiemController.text,
                                              selectedProvince!.id,
                                            );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.button,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child:
                                state.status == ThemHoatDongStatus.loadingAdd
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
      ),
    );
  }
}
