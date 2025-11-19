import 'package:booking_tour_flutter/presentation/admin/income_statistics/cubit/income_statistic_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class IncomeCubit extends Cubit<IncomeStatisticState> {
  IncomeCubit() : super(IncomeStatisticInitial());

  Future<void> loadIncome() async {
    emit(IncomeStatisticLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    try {
     
      final fakeMonths = [
        8500000,
        9000000,
        10500000,
        11200000,
        9000000,
        12000000,
        13000000,
        11000000,
        12500000,
        10800000,
        14500000,
        15000000,
      ];

      final total = fakeMonths.reduce((a, b) => a + b);
      final average = total ~/ fakeMonths.length;
      final highest = fakeMonths.reduce((a, b) => a > b ? a : b);
       emit(
        IncomeStatisticLoaded(
          totalIcome: total,
          average: average,
          highest: highest,
          months: fakeMonths,
        ),
      );
    }
    catch (e) {
        emit(IncomeStatisticError("Someting went wrong"));
    }
  }
}
