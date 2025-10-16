import 'package:flutter/material.dart';

class TourSelectionDialog extends StatefulWidget {
  final String title;
  final List<String> tours;
  final String searchHint;
  final Function(String) onSelected;

  const TourSelectionDialog({
    super.key,
    required this.title,
    required this.tours,
    required this.onSelected,
    this.searchHint = 'Tìm địa điểm',
  });

  @override
  State<TourSelectionDialog> createState() => _TourSelectionDialogState();
}

class _TourSelectionDialogState extends State<TourSelectionDialog> {
  String? selectedTour;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredTours = widget.tours
        .where((tour) => tour.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return AlertDialog(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: widget.searchHint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Flexible(
              child: filteredTours.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Không tìm thấy kết quả',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredTours.length,
                      itemBuilder: (context, index) {
                        final tour = filteredTours[index];
                        final isSelected = selectedTour == tour;
                        return ListTile(
                          title: Text(tour),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle, color: Colors.green)
                              : null,
                          tileColor: isSelected
                              ? Colors.green.withOpacity(0.1)
                              : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onTap: () {
                            setState(() {
                              selectedTour = tour;
                            });
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: selectedTour != null
              ? () {
                  widget.onSelected(selectedTour!);
                  Navigator.of(context).pop();
                }
              : null,
          child: const Text('Chọn'),
        ),
      ],
    );
  }
}