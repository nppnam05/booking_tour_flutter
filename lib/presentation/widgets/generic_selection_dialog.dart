import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

/// Generic Selection Dialog sử dụng awesome_dialog
/// Có thể nhận vào list kiểu bất kỳ và có hàm display để convert thành string
class GenericSelectionDialog {
 
  static Future<T?> showSingleSelection<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T) display,
    String? searchHint,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    DialogType dialogType = DialogType.info,
    AnimType animType = AnimType.scale,
    Color? primaryColor,
    Color? backgroundColor,
    bool showCloseIcon = true,
    List<T>? preSelectedItems,
  }) async {
    return await showDialog<T>(
      context: context,
      builder: (context) => _GenericSelectionDialog<T>(
        title: title,
        items: items,
        display: display,
        searchHint: searchHint,
        confirmText: confirmText,
        cancelText: cancelText,
        dialogType: dialogType,
        animType: animType,
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        showCloseIcon: showCloseIcon,
        isMultiSelect: false,
        preSelectedItems: preSelectedItems,
      ),
    );
  }

  static Future<List<T>?> showMultiSelection<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T) display,
    String? searchHint,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    DialogType dialogType = DialogType.info,
    AnimType animType = AnimType.scale,
    Color? primaryColor,
    Color? backgroundColor,
    bool showCloseIcon = true,
    List<T>? preSelectedItems,
  }) async {
    return await showDialog<List<T>>(
      context: context,
      builder: (context) => _GenericSelectionDialog<T>(
        title: title,
        items: items,
        display: display,
        searchHint: searchHint,
        confirmText: confirmText,
        cancelText: cancelText,
        dialogType: dialogType,
        animType: animType,
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        showCloseIcon: showCloseIcon,
        isMultiSelect: true,
        preSelectedItems: preSelectedItems,
      ),
    );
  }


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

  /// Hiển thị dialog xác nhận
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
}

class _GenericSelectionDialog<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) display;
  final String? searchHint;
  final String confirmText;
  final String cancelText;
  final DialogType dialogType;
  final AnimType animType;
  final Color? primaryColor;
  final Color? backgroundColor;
  final bool showCloseIcon;
  final bool isMultiSelect;
  final List<T>? preSelectedItems;

  const _GenericSelectionDialog({
    required this.title,
    required this.items,
    required this.display,
    this.searchHint,
    required this.confirmText,
    required this.cancelText,
    required this.dialogType,
    required this.animType,
    this.primaryColor,
    this.backgroundColor,
    this.showCloseIcon = true,
    required this.isMultiSelect,
    this.preSelectedItems,
  });

  @override
  State<_GenericSelectionDialog<T>> createState() => _GenericSelectionDialogState<T>();
}

class _GenericSelectionDialogState<T> extends State<_GenericSelectionDialog<T>> {
  late List<T> _filteredItems;
  final TextEditingController _searchController = TextEditingController();
  Set<T> _selectedItems = {};

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);
    if (widget.preSelectedItems != null) {
      _selectedItems = Set.from(widget.preSelectedItems!);
    }
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      _filteredItems = widget.items
          .where((item) => widget.display(item).toLowerCase().contains(query))
          .toList();
    });
  }

  void _toggleItem(T item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        if (widget.isMultiSelect) {
          _selectedItems.add(item);
        } else {
          _selectedItems.clear();
          _selectedItems.add(item);
        }
      }
    });
  }

  void _onConfirm() {
    if (widget.isMultiSelect) {
      Navigator.of(context).pop(List<T>.from(_selectedItems));
    } else {
      Navigator.of(context).pop(_selectedItems.isNotEmpty ? _selectedItems.first : null);
    }
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 400,
        constraints: const BoxConstraints(maxHeight: 600),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildSearchField(),
            const SizedBox(height: 16),
            Expanded(child: _buildItemsList()),
            const SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (widget.showCloseIcon)
          IconButton(
            onPressed: _onCancel,
            icon: const Icon(Icons.close),
            iconSize: 24,
          ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: widget.searchHint ?? 'Tìm kiếm...',
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.primaryColor ?? Colors.teal,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    if (_filteredItems.isEmpty) {
      return const Center(
        child: Text(
          'Không tìm thấy kết quả',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        final isSelected = _selectedItems.contains(item);
        
        return _SelectionListItem<T>(
          item: item,
          display: widget.display,
          isSelected: isSelected,
          isMultiSelect: widget.isMultiSelect,
          onTap: () => _toggleItem(item),
          primaryColor: widget.primaryColor,
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _onCancel,
          child: Text(
            widget.cancelText,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: _selectedItems.isNotEmpty ? _onConfirm : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.primaryColor ?? Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            widget.confirmText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class _SelectionListItem<T> extends StatelessWidget {
  final T item;
  final String Function(T) display;
  final bool isSelected;
  final bool isMultiSelect;
  final VoidCallback onTap;
  final Color? primaryColor;

  const _SelectionListItem({
    required this.item,
    required this.display,
    required this.isSelected,
    required this.isMultiSelect,
    required this.onTap,
    this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? (primaryColor ?? Colors.teal).withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected 
                ? (primaryColor ?? Colors.teal)
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                display(item),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected 
                      ? (primaryColor ?? Colors.teal)
                      : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                isMultiSelect ? Icons.check_box : Icons.radio_button_checked,
                color: primaryColor ?? Colors.teal,
                size: 24,
              )
            else
              Icon(
                isMultiSelect ? Icons.check_box_outline_blank : Icons.radio_button_unchecked,
                color: Colors.grey[400],
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
