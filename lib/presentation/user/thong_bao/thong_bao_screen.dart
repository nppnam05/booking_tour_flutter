import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/thong_bao/cubit/thong_bao_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/thong_bao/cubit/thong_bao_state.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThongBaoScreen extends StatefulWidget {
  const ThongBaoScreen({super.key});

  @override
  State<ThongBaoScreen> createState() => _ThongBaoScreenState();
}

class _ThongBaoScreenState extends State<ThongBaoScreen> {
  late final TextEditingController searchController;
  late final ThongBaoCubit cubit;
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    cubit = ThongBaoCubit();

    searchController.addListener(() {
      cubit.search(searchController.text);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoaded) {
      final userId = context.read<AuthCubit>().userId;
      cubit.load(userId);
      _hasLoaded = true;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Thông báo", style: TextStyle(color: Colors.white)),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              SearchBarWidget(
                controller: searchController,
                hintText: "Tìm kiếm thông báo",
              ),
              Expanded(
                child: BlocBuilder<ThongBaoCubit, ThongBaoState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.filteredItems.length,
                      itemBuilder: (context, index) {
                        final n = state.filteredItems[index];
                        return _buildThongBaoItem(
                          dateTime: n.createdAt,
                          content: n.content,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThongBaoItem({
    required DateTime dateTime,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: AppFonts.fontSize12,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: AppFonts.fontSize14,
                color: AppColors.black,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Trân trọng !",
                style: TextStyle(
                  fontSize: AppFonts.fontSize14,
                  color: AppColors.borderButton,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
