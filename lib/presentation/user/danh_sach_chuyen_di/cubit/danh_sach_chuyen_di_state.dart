import 'package:booking_tour_flutter/domain/trip.dart';

class DanhSachChuyenDiState {
  final List<Trip> mostFavoriteTrips;
  final List<Trip> mostRecent;
  final bool isLoading;
  final String searchQuery;

  DanhSachChuyenDiState({
    this.mostFavoriteTrips = const [],
    this.mostRecent = const [],
    this.isLoading = true,
    this.searchQuery = '',
  });

  List<Trip> get filteredMostRecent {
    if (searchQuery.isEmpty) {
      return mostRecent;
    }

    final query = searchQuery.toLowerCase().trim();

    return mostRecent.where((trip) {
      final tripName = trip.title;
      return tripName.toLowerCase().contains(query);
    }).toList();
  }

  DanhSachChuyenDiState copyWith({
    List<Trip>? mostFavoriteTrips,
    List<Trip>? mostRecent,
    bool? isLoading,
    String? searchQuery,
  }) {
    return DanhSachChuyenDiState(
      mostFavoriteTrips: mostFavoriteTrips ?? this.mostFavoriteTrips,
      mostRecent: mostRecent ?? this.mostRecent,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
