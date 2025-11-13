import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/favorite_cubit.dart';
import 'cubit/favorite_state.dart';
import 'favorite_tour_card.dart';
import '../danh_sach_chuyen_di/danh_sach_chuyen_di_screen.dart';
import '../profile/profileUser_screen.dart';

class FavoriteTourScreen extends StatefulWidget {
  final int userId;

  const FavoriteTourScreen({super.key, required this.userId});

  @override
  State<FavoriteTourScreen> createState() => _FavoriteTourScreenState();
}

class _FavoriteTourScreenState extends State<FavoriteTourScreen> {
  late final FavoriteCubit _cubit;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _cubit = FavoriteCubit();
    _cubit.loadFavorites(userId: widget.userId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DanhSachChuyenDiScreen()),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileUserScreen(userId: widget.userId),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yêu thích',
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundAppBarTheme,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoriteError) {
            return Center(child: Text(state.message));
          }

          if (state is FavoriteLoaded) {
            final favorites = state.favorites;

            if (favorites.isEmpty) {
              return const Center(child: Text('Không có tour yêu thích'));
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return FavoriteTourCard(
                  favorite: favorite,
                  isFavorite: true,
                  onFavoriteToggle: () {
                    _cubit.removeFavorite(
                      tourId: favorite.tourId,
                      userId: favorite.userId,
                    );
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.textPrimary,
        backgroundColor: AppColors.backgroundAppBarTheme,
      ),
    );
  }
}
