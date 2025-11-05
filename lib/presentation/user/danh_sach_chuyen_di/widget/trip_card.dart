import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/danh_sach_chuyen_di_test.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final TripTest trip;
  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.network(trip.imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFonts.fontSize14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${trip.duration}  ${trip.location}',
                  style: const TextStyle(
                    fontSize: AppFonts.fontSize12,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${trip.price.toStringAsFixed(0)} VND',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                    fontSize: AppFonts.fontSize12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
