import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/cubit/add_tour_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTourCubit extends Cubit<AddTourState> {
  AddTourCubit() : super(AddTourState(images: []));

  Future<void> chooseImages() async{
  }

  void deleteAllImages(){
    state.copyWith(images: []);
    emit(state);
  }
}
