import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/trip_bloc.dart';
import '../../blocs/trip_event.dart';
import '../../blocs/trip_state.dart';
import '../../models/trip.dart';
import '../../presentation/widgets_dialog/dialog_noti.dart';
import 'trip_card.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TripBloc()..add(LoadTrips()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quản lý chuyến đi'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // TODO: Mở drawer menu
              print('Mở menu');
            },
          ),
        ),
        body: BlocBuilder<TripBloc, TripState>(
          builder: (context, state) {
            if (state is TripLoaded) {
              return ListView(
                children: state.trips.map<TripCard>((trip) {
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
                        context.read<TripBloc>().add(DeleteTrip(trip));
                      }
                    },
                    onView: () {
                      // TODO: Chuyển sang màn hình chi tiết chuyến đi
                    },
                  );
                }).toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: 
         FloatingActionButton.extended(
          onPressed: () {
            // TODO: Chuyển sang màn hình thêm chuyến đi
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
