import 'package:booking_tour_flutter/domain/favorite.dart';
import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:flutter/material.dart';

class FavoriteTourCard extends StatelessWidget {
  final Favorite favorite;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;

  const FavoriteTourCard({
    Key? key,
    required this.favorite,
    required this.onFavoriteToggle,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Trip trip = favorite.tour;
    final String? imageUrl =
        (trip.tourImages.isNotEmpty) ? trip.tourImages.first : null;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child:
                    imageUrl != null
                        ? Image.network(
                          imageUrl,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                                height: 160,
                                color: Colors.grey[200],
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 56,
                                  color: Colors.grey,
                                ),
                              ),
                        )
                        : Container(
                          height: 160,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.image,
                            size: 56,
                            color: Colors.grey,
                          ),
                        ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.beach_access, color: Colors.green),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            trip.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(
                          Icons.local_offer,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${trip.price} VND /người',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            trip.provinces.map((p) => p.name).join(', '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
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
