import 'package:booking_tour_flutter/presentation/trip/cubit/trip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/presentation/trip/cubit/trip_state.dart';
import 'package:booking_tour_flutter/presentation/trip/trip_card.dart';
import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';

class TripScreen extends StatelessWidget {
  final _cubit = TripCubit()..loadTrips();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quản lý chuyến đi'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<TripCubit, TripState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is TripLoaded) {
              return ListView(
                children: state.trips.map((trip) {
                  return TripCard(
                    trip: trip,
                    onDelete: () async {
                      final confirmed = await DialogNoti.confirm(
                        context: context,
                        title: 'Xác nhận xóa',
                        message: 'Bạn có chắc muốn xóa chuyến đi này?',
                        highlightPhrases: ['xóa chuyến đi'],
                      );
                      if (confirmed) {
                        _cubit.deleteTrip(trip);
                      }
                    },
                    onView: () {
                      // TODO: Chuyển sang màn hình chi tiết chuyến đi
                    },
                  );
                }).toList(),
              );
            }

            if (state is TripError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('Thêm chuyến đi');
          },
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          icon: Icon(Icons.add),
          label: Text('Thêm Chuyến đi'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
