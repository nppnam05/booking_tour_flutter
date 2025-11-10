class Notification {
  final int id;
  final int userId;
  final String content;
  final bool isRead;
  final DateTime createdAt;
  Notification({
    required this.id,
    required this.userId,
    required this.content,
    required this.isRead,
    required this.createdAt,
  });
}
