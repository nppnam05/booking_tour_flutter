import 'package:booking_tour_flutter/blocs/participants_bloc.dart';
import 'package:booking_tour_flutter/blocs/participants_sate.dart';
import 'package:booking_tour_flutter/presentation/tour_guide/participants_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/schedule_tourguide.dart';

class ParticipantsScreen extends StatelessWidget {
  final ScheduleTourguide schedule;

  const ParticipantsScreen({Key? key, required this.schedule}) : super(key: key);

  String _formatDate(DateTime d) {
    final two = (int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ParticipantsCubit()
        ..loadParticipants(schedule.idSchedule, schedule.startDate, schedule.endDate),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách người tham gia'),
          backgroundColor: Colors.teal,
        ),
        body: BlocBuilder<ParticipantsCubit, ParticipantsState>(
          builder: (context, state) {
            if (state is ParticipantsLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Mã: ${state.scheduleCode}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${_formatDate(state.startDate)} - ${_formatDate(state.endDate)}',
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.participants.length,
                      itemBuilder: (context, index) {
                        return ParticipantCard(participant: state.participants[index]);
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
