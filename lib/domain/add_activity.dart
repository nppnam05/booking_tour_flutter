class AddActivity {
  final String action;

  AddActivity({required this.action});

  Map<String, dynamic> toJson() => {
        'action': action,
      };
}
