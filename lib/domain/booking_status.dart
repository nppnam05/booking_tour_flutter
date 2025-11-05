class BookingStatus {
  int id;
  String name;

  BookingStatus({required this.id, required this.name});

  factory BookingStatus.empty() {
    return BookingStatus(id: 0, name: "");
  }
}
