import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/favorite_cubit.dart';
import 'cubit/favorite_state.dart';
import 'favorite_tour_card.dart';

class FavoriteTourScreen extends StatefulWidget {
  final int userId;
  
  const FavoriteTourScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<FavoriteTourScreen> createState() => _FavoriteTourScreenState();
}

class _FavoriteTourScreenState extends State<FavoriteTourScreen> {
  late final FavoriteCubit _cubit;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yêu thích'),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
    );
  }
}
