import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DialogNoti {
  /// dialog thông báo đơn giản
  static Future<void> showInfo({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onOk,
    DialogType dialogType = DialogType.info,
    AnimType animType = AnimType.scale,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: title,
      desc: message,
      btnOkText: buttonText,
      btnOkOnPress: onOk,
    ).show();
  }

  /// dialog xác nhận
  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    DialogType dialogType = DialogType.warning,
    AnimType animType = AnimType.scale,
  }) async {
    final result = await AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: title,
      desc: message,
      btnOkText: confirmText,
      btnCancelText: cancelText,
      btnOkOnPress: onConfirm,
      btnCancelOnPress: onCancel,
    ).show();
    return result;
  }

  static Future<void> showError({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'Đóng',
    VoidCallback? onOk,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: title,
      desc: message,
      btnOkText: buttonText,
      btnOkOnPress: onOk,
    ).show();
  }

  // dialog thành công
  static Future<void> showSuccess({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onOk,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: title,
      desc: message,
      btnOkText: buttonText,
      btnOkOnPress: onOk,
    ).show();
  }

  ///dialog cảnh báo
  static Future<bool?> showWarning({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Tiếp tục',
    String cancelText = 'Hủy',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    final result = await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: title,
      desc: message,
      btnOkText: confirmText,
      btnCancelText: cancelText,
      btnOkOnPress: onConfirm,
      btnCancelOnPress: onCancel,
    ).show();
    return result;
  }
}