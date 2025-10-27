import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/schedule_assignment_tourguide.dart';
import 'package:booking_tour_flutter/domain/tour_guide.dart';
import 'package:booking_tour_flutter/presentation/assignment/tour_guide_assignment/cubit/tour_guide_assignment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TourGuideAssignmentCubit extends Cubit<TourGuideAssignmentState> {
  static final scheduleAssignmentTourguide = getIt<BookingRepository>();

  TourGuideAssignmentCubit() : super(TourGuideAssignmentState(tourGuides: [], schedule: ScheduleAssignmentTourguide.empty(), tourGuidesSearch: []));

  Future<void> syncPost({required int idschedule}) async {
    var schedule = await scheduleAssignmentTourguide.getScheduleAssignmentById(id: idschedule);

    schedule.fold((failure) {
      
    }, (schedule){
      emit(state.copyWith(schedule: schedule));
    });


    var tourGuides = await scheduleAssignmentTourguide.getTourGuides(idschedule: idschedule);
    tourGuides.fold((failure){

    },(tourGuides){
      emit(state.copyWith(tourGuides: tourGuides, tourGuidesSearch: tourGuides));
    });
  }

  void searchTourGuides(String query) {
    final filteredTourGuides = state.tourGuides.where((guide) {
      final guideName = guide.user.name.toLowerCase() ?? '';
      final guideCode = guide.code?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();
      
      return guideName.contains(searchLower) || guideCode.contains(searchLower);
    }).toList();

    emit(state.copyWith(tourGuidesSearch: filteredTourGuides));
  }

  void toggleTourGuideCheck(int userId, bool isChecked) {
    final updatedList = state.tourGuides.map((guide) {
      if (guide.userId == userId) {
        return guide.copyWith(ischecked: isChecked);  
      }
      return guide;
    }).toList();

    emit(state.copyWith(tourGuides: updatedList));
  }

  Future<bool> touchButton() async {
    var tourGuideResponse = state.tourGuides.map((t) => t.toResponse()).toList();

    var response = await scheduleAssignmentTourguide.checkAssignment(
      scheduleId: state.schedule.id,
      tourGuides: tourGuideResponse,
    );

    bool isSuccess = false;

    response.fold((failure) {
      isSuccess = false;
    }, (success) {
      isSuccess = success;
    });

    return isSuccess;

  }
}