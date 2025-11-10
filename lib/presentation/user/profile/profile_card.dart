import 'package:flutter/material.dart';
import 'package:booking_tour_flutter/domain/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: user.avatarPath.isNotEmpty
              ? NetworkImage('${user.avatarPath}')
              : null,
            child: user.avatarPath.isEmpty ? const Icon(Icons.person, size: 32) : null,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              Text(user.email, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}