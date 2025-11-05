import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;

  const TripCard({
    required this.trip,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(trip.tourImages.first, height: 180, width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('${trip.price} VND /người', style: TextStyle(color: Colors.red)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(trip.provinces.map((p) => p.name).join(', ')),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('Thời gian: ${trip.day} ngày'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: onFavoriteToggle,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
