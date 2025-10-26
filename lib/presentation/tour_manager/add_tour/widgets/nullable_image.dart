import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';

class NullableImage extends StatelessWidget {
  const NullableImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: double.infinity, height: 250),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [emptyImage(context)]),
      ),
    );
  }

  Widget emptyImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("Empty", style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
