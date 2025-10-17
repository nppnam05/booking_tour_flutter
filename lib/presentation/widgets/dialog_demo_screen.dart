import 'package:flutter/material.dart';
import 'dialog_examples.dart';

class DialogDemoScreen extends StatelessWidget {
  const DialogDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Generic Selection Dialog Tests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // Selection Tests
            const Text(
              'Selection Tests:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            
            _buildTestButton(
              context: context,
              title: 'Test Multi Selection (Hoạt động)',
              subtitle: 'Chọn nhiều hoạt động từ list String',
              onPressed: () => DialogExamples.testStringSelection(context),
              color: Colors.blue,
            ),
            
            _buildTestButton(
              context: context,
              title: 'Test Custom Object Selection',
              subtitle: 'Chọn hoạt động từ custom object',
              onPressed: () => DialogExamples.testCustomObjectSelection(context),
              color: Colors.orange,
            ),
            
            const SizedBox(height: 20),
            
            // Notification Dialog Tests
            const Text(
              'Notification Dialogs:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            
            _buildTestButton(
              context: context,
              title: 'Test All Notification Dialogs',
              subtitle: 'Test info, success, error, warning dialogs',
              onPressed: () => DialogExamples.testNotificationDialogs(context),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestButton({
    required BuildContext context,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}