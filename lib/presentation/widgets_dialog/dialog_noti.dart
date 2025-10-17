import 'package:flutter/material.dart';

class DialogNoti {
  static Future<T?> pick<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T item) display,
    String? message,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    T? initialSelected,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _SelectionDialog<T>(
        title: title,
        items: items,
        display: display,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        initialSelected: initialSelected,
      ),
    );
  }
}

class _SelectionDialog<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T item) display;
  final String? message;
  final String confirmText;
  final String cancelText;
  final T? initialSelected;

  const _SelectionDialog({
    required this.title,
    required this.items,
    required this.display,
    this.message,
    this.confirmText = 'Xác nhận',
    this.cancelText = 'Hủy',
    this.initialSelected,
  });

  @override
  State<_SelectionDialog<T>> createState() => _SelectionDialogState<T>();
}

class _SelectionDialogState<T> extends State<_SelectionDialog<T>> {
  late T? _selected = widget.initialSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420, maxHeight: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Text(
                widget.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(height: 1),

            // Message (optional)
            if (widget.message != null && widget.message!.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
                child: Text(
                  widget.message!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.separated(
                    itemCount: widget.items.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      final isSelected = _selected == item;
                      return ListTile(
                        title: Text(widget.display(item)),
                        leading: Radio<T>(
                          value: item,
                          groupValue: _selected,
                          onChanged: (v) => setState(() => _selected = v),
                        ),
                        onTap: () => setState(() => _selected = item),
                        selected: isSelected,
                        selectedTileColor:
                            theme.colorScheme.primary.withOpacity(0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                      );
                    },
                  ),
                ),
              ),
            ),

            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Xác nhận
                  ElevatedButton(
                    onPressed: _selected == null
                        ? null
                        : () => Navigator.of(context).pop(_selected),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(widget.confirmText),
                  ),
                  const SizedBox(width: 12),
                  // Hủy
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(widget.cancelText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}