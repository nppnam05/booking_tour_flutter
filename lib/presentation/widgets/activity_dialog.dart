import 'package:flutter/material.dart';

// MODEL 
class SelectableItem {
  final String id;
  final String label;
  bool isSelected;

  SelectableItem({
    required this.id,
    required this.label,
    this.isSelected = false,
  });
}

// REUSABLE WIDGET - Multi Select Dialog
class MultiSelectDialog extends StatefulWidget {
  final String title;
  final String searchHint;
  final List<SelectableItem> items;
  final String confirmButtonText;
  final String cancelButtonText;
  final Function(List<SelectableItem>)? onConfirm;
  final VoidCallback? onCancel;

  const MultiSelectDialog({
    Key? key,
    required this.title,
    required this.items,
    this.searchHint = 'Tìm kiếm...',
    this.confirmButtonText = 'Xác nhận',
    this.cancelButtonText = 'Hủy',
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  @override
  State<MultiSelectDialog> createState() => _MultiSelectDialogState();
  /// Static method to show the dialog and return selected items
  static Future<List<SelectableItem>?> show({
    required BuildContext context,
    required String title,
    required List<SelectableItem> items,
    String searchHint = 'Tìm kiếm...',
    String confirmButtonText = 'Xác nhận',
    String cancelButtonText = 'Hủy',
  }) {
    return showDialog<List<SelectableItem>>(
      context: context,
      builder: (context) => MultiSelectDialog(
        title: title,
        items: items,
        searchHint: searchHint,
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
      ),
    );
  }
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<SelectableItem> _items;
  late List<SelectableItem> _filteredItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _items = widget.items;
    _filteredItems = List.from(_items);
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
      _filteredItems = _items
          .where((item) => item.label.toLowerCase().contains(query))
          .toList();
    });
  }

  void _toggleItem(int index) {
    setState(() {
      _filteredItems[index].isSelected = !_filteredItems[index].isSelected;
    });
  }

  void _onConfirm() {
    final selectedItems = _items.where((item) => item.isSelected).toList();
    if (widget.onConfirm != null) {
      widget.onConfirm!(selectedItems);
    }
    Navigator.of(context).pop(selectedItems);
  }

  void _onCancel() {
    if (widget.onCancel != null) {
      widget.onCancel!();
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 370,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildSearchField(),
            const SizedBox(height: 16),
            _buildItemsList(),
            const SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      widget.title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: widget.searchHint,
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
          borderSide: const BorderSide(color: Colors.teal, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return SelectableListItem(
            item: _filteredItems[index],
            onTap: () => _toggleItem(index),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(widget.confirmButtonText),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _onCancel,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(widget.cancelButtonText),
        ),
      ],
    );
  }
}

// REUSABLE COMPONENT - Selectable List Item
class SelectableListItem extends StatelessWidget {
  final SelectableItem item;
  final VoidCallback onTap;

  const SelectableListItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: item.isSelected ? Colors.green[50] : Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (item.isSelected)
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
class ActivitySelectionScreen extends StatefulWidget {
  const ActivitySelectionScreen({Key? key}) : super(key: key);

  @override
  State<ActivitySelectionScreen> createState() =>
      _ActivitySelectionScreenState();
}

class _ActivitySelectionScreenState extends State<ActivitySelectionScreen> {
  List<SelectableItem> _selectedActivities = [];

  void _showActivityDialog() async {
    final activities = [
      SelectableItem(id: '1', label: 'Tắm biển', isSelected: true),
      SelectableItem(id: '2', label: 'Leo núi', isSelected: true),
      SelectableItem(id: '3', label: 'Tham quan'),
      SelectableItem(id: '4', label: 'Nghỉ ngơi'),
    ];

    final result = await MultiSelectDialog.show(
      context: context,
      title: 'Chọn hoạt động',
      items: activities,
      searchHint: 'Tìm địa điểm',
      confirmButtonText: 'Xác nhận',
      cancelButtonText: 'Hủy',
    );

    if (result != null) {
      setState(() {
        _selectedActivities = result;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã chọn ${result.length} hoạt động'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn hoạt động du lịch'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showActivityDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Chọn hoạt động',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedActivities.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Hoạt động đã chọn:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._selectedActivities.map(
                      (item) => Chip(
                        label: Text(item.label),
                        backgroundColor: Colors.green[100],
                      ),
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

// Main app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Select Dialog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const ActivitySelectionScreen(),
    );
  }
}