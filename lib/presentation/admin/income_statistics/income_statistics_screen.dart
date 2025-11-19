import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/presentation/admin/income_statistics/cubit/incom_statistic_cubit.dart';
import 'package:booking_tour_flutter/presentation/admin/income_statistics/income_statistics_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/income_statistic_state.dart';


class IncomeStatisticScreen extends StatefulWidget {
  const IncomeStatisticScreen({super.key});

  @override
  State<IncomeStatisticScreen> createState() => _IncomeStatisticScreenState();
}

class _IncomeStatisticScreenState extends State<IncomeStatisticScreen> {
  @override
  void initState() {
    super.initState();
    context.read<IncomeCubit>().loadIncome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocBuilder<IncomeCubit, IncomeStatisticState>(
        builder: (context, state) {
          if (state is IncomeStatisticLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is IncomeStatisticLoaded) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Thống kê thu nhập",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.backgroundAppBarTheme,
                      
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "TỔNG THU NHẬP",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${state.totalIcome} VND",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.teal,
                              width: 2,
                            ),
                          ),
                          child: const Text(
                            "Theo tháng",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Theo năm",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Biểu đồ thu nhập",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 12),
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: BarChart(
                        BarChartData(
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  final index = value.toInt();
                                  if (index < 12) {
                                    return Text("T${index + 1}",
                                        style:
                                            const TextStyle(fontSize: 12));
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                          barGroups: List.generate(state.months.length, (i) {
                            final vnd = state.months[i] / 1000000; // về triệu
                            return BarChartGroupData(
                              x: i,
                              barRods: [
                                BarChartRodData(
                                  toY: vnd.toDouble(),
                                  width: 18,
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                )
                              ],
                              
                            );
                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

            
                    Row(
                      children: [
                        Expanded(
                          child: IncomeSummaryCard(
                            title: "Trung bình / tháng",
                            value: "${state.average} VND",
                            icon: Icons.trending_up,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: IncomeSummaryCard(
                            title: "Cao nhất",
                            value: "${state.highest} VND",
                            icon: Icons.attach_money,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          }

          return const Center(child: Text("Có lỗi xảy ra"));
        },
      ),
    );
  }
}
