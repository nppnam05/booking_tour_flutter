class Guide {
  final int staffId;
  final int scheduleId;

  Guide({required this.staffId, required this.scheduleId});

  static Guide empty() {
    return Guide(staffId: 0, scheduleId: 0);
  }
}