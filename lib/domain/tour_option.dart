class TourOption {
  final int id;
  final String title;
  const TourOption({required this.id, required this.title});

  static List<TourOption> fromTrips(List trips) {
    final Map<int, String> idToTitle = {};
    for (final t in trips) {
      final id = t.id;
      final title = t.title ?? '';
      if (id != null && title.isNotEmpty) {
        idToTitle[id] = title;
      }
    }
    return idToTitle.entries
        .map((e) => TourOption(id: e.key, title: e.value))
        .toList();
  }
}

