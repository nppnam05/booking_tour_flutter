class Schedule {
  final String imageUrl;
  final String location;
  final String description;
  final String startDate;
  final String endDate;
  final int maxCapacity;
  final int? finalPrice;

  final int? id;
  final int? tourId;
  final String? openDateIso;
  final String? startDateIso;
  final String? endDateIso;
  final String? gatheringTime;
  final String? code;
  final int? desposit;
  final String? tourTitle;
  final List<String>? tourImages;
  final List<String>? tourLocations;

  Schedule({
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.maxCapacity,
    this.finalPrice,
    this.id,
    this.tourId,
    this.openDateIso,
    this.startDateIso,
    this.endDateIso,
    this.gatheringTime,
    this.code,
    this.desposit,
    this.tourTitle,
    this.tourImages,
    this.tourLocations,
  });
}

class TourOption {
  final int id;
  final String title;
  const TourOption({required this.id, required this.title});
}