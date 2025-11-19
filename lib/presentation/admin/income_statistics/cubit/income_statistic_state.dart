abstract class IncomeStatisticState {}
class IncomeStatisticInitial extends IncomeStatisticState {}
class IncomeStatisticLoading extends IncomeStatisticState {}
class IncomeStatisticLoaded extends IncomeStatisticState {
   final int  totalIcome ; 
   final int  average ; 
   final int  highest ; 
   final  List<int> months ;
   IncomeStatisticLoaded({
    required this.totalIcome,
    required this.average,
    required this.highest,
    required this.months,
   }) ; 
}
class IncomeStatisticError extends IncomeStatisticState { 
  final String message; 
  IncomeStatisticError(this.message);
}