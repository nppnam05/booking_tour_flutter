import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';

class BkTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Color? fillColor;
  final String hint;
  final ValueChanged<String>? onChange;
  final bool isShowError;
  final String? errorMessage;

  const BkTextfield({
    super.key,
    required this.controller,
    required this.title,
    this.fillColor,
    required this.hint,
    this.onChange,
    this.isShowError = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    var isError = isShowError && errorMessage != null;
    Color? borderColor = isError ? AppColors.error : null;

    var inputDecorationTheme = Theme.of(context).inputDecorationTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 4.0),

        TextField(
          controller: controller,
          decoration: const InputDecoration()
              .applyDefaults(
                Theme.of(context).inputDecorationTheme.copyWith(
                  border: inputDecorationTheme.border!.copyWith(
                    borderSide: inputDecorationTheme.border!.borderSide
                        .copyWith(color: borderColor),
                  ),
                  focusedBorder: inputDecorationTheme.focusedBorder!.copyWith(
                    borderSide: inputDecorationTheme.focusedBorder!.borderSide
                        .copyWith(color: borderColor),
                  ),
                  enabledBorder: inputDecorationTheme.enabledBorder!.copyWith(
                    borderSide: inputDecorationTheme.enabledBorder!.borderSide
                        .copyWith(color: borderColor),
                  ),
                ),
              )
              .copyWith(hintText: hint, fillColor: fillColor),
          onChanged: onChange,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        ),

        Visibility(
          visible: isError,
          child: Text(
            errorMessage ?? "",
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.error),
          ),
        ),
      ],
    );
  }
}
