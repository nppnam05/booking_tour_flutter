import 'dart:io';

import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'cubit/create_staff_account_part2_cubit.dart';
import 'cubit/create_staff_account_part2_state.dart';

class CreateStaffAccountPart2Screen extends StatelessWidget {
  const CreateStaffAccountPart2Screen({super.key});

  void _showOptions(BuildContext context, {required bool isFront}) {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Chụp ảnh'),
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<CreateStaffAccountPart2Cubit>().pickImage(
                      ImageSource.camera,
                      isFront: isFront,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Chọn từ thư viện'),
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<CreateStaffAccountPart2Cubit>().pickImage(
                      ImageSource.gallery,
                      isFront: isFront,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('Huỷ'),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
    );
  }

  Widget _imageSlot({
    required BuildContext context,
    required String label,
    required String? path,
    required bool isFront,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showOptions(context, isFront: isFront),
          child: Stack(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                clipBehavior: Clip.hardEdge,
                child:
                    path == null
                        ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.add_circle_outline,
                                size: 34,
                                color: Colors.black45,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Thêm ảnh',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                        )
                        : Image.file(
                          File(path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
              ),
              if (path != null)
                Positioned(
                  right: 6,
                  top: 6,
                  child: InkWell(
                    onTap:
                        () => context
                            .read<CreateStaffAccountPart2Cubit>()
                            .removeImage(isFront: isFront),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateStaffAccountPart2Cubit(),
      child: BlocBuilder<
        CreateStaffAccountPart2Cubit,
        CreateStaffAccountPart2State
      >(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.white,
                appBar: AppBar(
                  backgroundColor: AppColors.backgroundAppBarTheme,
                  leading: const BackButton(color: Colors.white),
                  title: const Text('Thêm ảnh CCCD trước/ sau'),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    child: Column(
                      children: [
                        _imageSlot(
                          context: context,
                          label: 'Mặt trước CCCD',
                          path: state.frontPath,
                          isFront: true,
                        ),
                        const SizedBox(height: 18),
                        _imageSlot(
                          context: context,
                          label: 'Mặt sau CCCD',
                          path: state.backPath,
                          isFront: false,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: BkButton(
                            title: 'Xác nhận',
                            onPressed: () async {
                              final result =
                                  await context
                                      .read<CreateStaffAccountPart2Cubit>()
                                      .confirm();
                              Navigator.of(context).pop(result);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state.submitting)
                Positioned.fill(
                  child: Container(
                    color: Colors.black45,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
