import 'package:flutter/material.dart';
import '../../domain/schedule.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule trip;
  final VoidCallback onDelete;

  const ScheduleCard({
    required this.trip,
    required this.onDelete,
  });

  String _formatDate(DateTime d) {
    final two = (int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFFE0F2F1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    trip.imageUrl,
                    width: 110,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16, color: Colors.black87),
                          const SizedBox(width: 6),
                          Text(
                            _formatDate(trip.startDate),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_right_alt, color: Colors.purple),
                          const SizedBox(width: 8),
                          Text(
                            _formatDate(trip.endDate),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16, color: Colors.orange),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              trip.location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.park, size: 16, color: Colors.green),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              trip.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.group, size: 16, color: Colors.blue),
                          const SizedBox(width: 6),
                          Text('Tối đa: ${trip.capacity}')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onDelete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Xóa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}