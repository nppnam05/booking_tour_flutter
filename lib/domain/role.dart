class Role {
  final String id;
  final String title;

  Role({required this.id, required this.title});

  static Role empty() {
    return Role(id: '', title: '');
  }
}