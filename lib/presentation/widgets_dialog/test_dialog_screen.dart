import 'package:flutter/material.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';

class TestDialogScreen extends StatefulWidget {
  const TestDialogScreen({super.key});

  @override
  State<TestDialogScreen> createState() => _TestDialogScreenState();
}

class _TestDialogScreenState extends State<TestDialogScreen> {
  final _activities = const ['Tắm biển', 'Leo núi', 'Tham quan', 'Nghỉ ngơi'];

  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _testDialogNotiPick() async {
    final picked = await DialogNoti.pick<String>(
      context: context,
      title: 'Chọn hoạt động',
      items: _activities,
      display: (s) => s,
      message: 'Hãy chọn 1 hoạt động trong danh sách',
      confirmText: 'Xác nhận',
      cancelText: 'Hủy',
    );
    _showSnack('DialogNoti.pick => ${picked ?? 'null'}');
  }

  Future<void> _testSelectionSingle() async {
    final picked = await DialogHelper.selectOne<String>(
      context: context,
      title: 'Chọn hoạt động',
      items: _activities,
      display: (s) => s,
      // initial: 'Leo núi',
    );
    _showSnack('SelectionDialog single => ${picked ?? 'null'}');
  }

  Future<void> _testSelectionMulti() async {
    final picked = await DialogHelper.selectMany<String>(
      context: context,
      title: 'Chọn hoạt động',
      items: _activities,
      display: (s) => s,
      // initial: const ['Tắm biển', 'Leo núi'],
    );
    _showSnack('SelectionDialog multi => ${picked.join(', ')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Dialogs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildBtn(
              label: 'Test DialogNoti.pick (radio)',
              color: Colors.blue,
              onTap: _testDialogNotiPick,
            ),
            const SizedBox(height: 12),
            _buildBtn(
              label: 'Test SelectionDialog - Single',
              color: Colors.green,
              onTap: _testSelectionSingle,
            ),
            const SizedBox(height: 12),
            _buildBtn(
              label: 'Test SelectionDialog - Multi',
              color: Colors.purple,
              onTap: _testSelectionMulti,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBtn({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}