import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:flutter/material.dart';
class SearchCard extends StatelessWidget {
  final Trip trip;
  const SearchCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = trip.totalReviews > 0
        ? (trip.totalStars / trip.totalReviews).toStringAsFixed(1)
        : "0.0";

    return GestureDetector(
      onTap: () {
       
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                trip.tourImages.first,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trip.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Thời gian: ${trip.day} ngày'),
                  Text(
                    'Địa điểm: ${trip.provinces.map((p) => p.name).join(", ")}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('$rating (${trip.totalReviews} đánh giá)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
