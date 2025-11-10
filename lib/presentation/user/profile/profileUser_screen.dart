import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/profile_cubit.dart';
import 'cubit/profile_state.dart';
import 'profile_card.dart';

class ProfileUserScreen extends StatefulWidget {
  final int userId;
  const ProfileUserScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  late final ProfileCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ProfileCubit(getIt<BookingRepository>());
    _cubit.loadUser(widget.userId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  Widget buildItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          if (state is ProfileLoaded) {
            final user = state.user;
            return Column(
              children: [
                ProfileCard(user: user),
                buildItem(
                  icon: Icons.person,
                  title: 'Tài Khoản Của Tôi',
                  subtitle: 'Thay đổi thông tin tài khoản của bạn',
                  onTap: () {},
                ),
                buildItem(
                  icon: Icons.account_balance_wallet,
                  title: 'Ví',
                  subtitle: 'nơi chứa tiền dư của bạn',
                  onTap: () {},
                ),
                buildItem(
                  icon: Icons.check_circle,
                  title: 'Hoàn Thành',
                  subtitle: 'các lịch trình đã hoàn thành',
                  onTap: () {},
                ),
                buildItem(
                  icon: Icons.receipt_long,
                  title: 'Lịch Sử Thanh Toán',
                  subtitle: 'xem lại lịch trình đã thanh toán',
                  onTap: () {},
                ),
                buildItem(
                  icon: Icons.logout,
                  title: 'Đăng Xuất',
                  subtitle: 'đăng xuất khỏi app',
                  onTap: () {print("Hi");},
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}