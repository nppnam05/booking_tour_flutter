import 'package:flutter/material.dart';
import '../presentation/widgets_dialog/generic_selected_dialog.dart';

class DialogHelper {
  /// Single select: returns T?
  static Future<T?> selectOne<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T item) display,
    String searchHint = 'Tìm địa điểm',
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    T? initial,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    await Future.delayed(const Duration(milliseconds: 50));

    var result = await showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => SelectionDialog<T>(
            title: title,
            items: items,
            display: display,
            searchHint: searchHint,
            confirmText: confirmText,
            cancelText: cancelText,
            isMultiSelect: false,
            preSelectedItems: initial == null ? const [] : [initial],
          ),
    );

    FocusManager.instance.primaryFocus?.unfocus();

    return result;
  }

  static Future<List<T>?> selectMany<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T item) display,
    String searchHint = 'Tìm địa điểm',
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    List<T> initial = const [],
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    await Future.delayed(const Duration(milliseconds: 50));

    if (!context.mounted) {
      return null;
    }

    final result = await showDialog<List<T>>(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => SelectionDialog<T>(
            title: title,
            items: items,
            display: display,
            searchHint: searchHint,
            confirmText: confirmText,
            cancelText: cancelText,
            isMultiSelect: true,
            preSelectedItems: initial,
          ),
    );

    FocusManager.instance.primaryFocus?.unfocus();

    return result;
  }
}
