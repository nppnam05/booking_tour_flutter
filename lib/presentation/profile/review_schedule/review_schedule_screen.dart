import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/presentation/profile/review_schedule/cubit/review_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/profile/review_schedule/cubit/review_schedule_state.dart';
import 'package:booking_tour_flutter/presentation/profile/review_schedule/widgets/stars_widget.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/bk_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewScheduleScreen extends StatelessWidget {
  final TextEditingController _commentController = TextEditingController();
  final ReviewScheduleCubit _cubit = ReviewScheduleCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Đánh giá chuyến đi")),
      body: CustomScrollView(
        slivers: [
          //tour
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.backgroundAppBarTheme,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/images/destination_place.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "Chuyến đi Phú Quốc 3N",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/code.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "Mã chuyến đi: CD23TT3",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/calender.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "15/10/2025 - 17/10/2025",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/start_place.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      "Khởi hành từ Tp. Hồ Chí Minh",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //comment
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //stars
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Chất lượng chuyến đi",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        BlocConsumer<ReviewScheduleCubit, ReviewScheduleState>(
                          bloc: _cubit,
                          listener: (context, state) async {
                            if (state.errorMessage != null) {
                              await DialogHelper.showInformDialog(
                                Text(state.errorMessage!),
                              );
                            }
                            if (state.sentReview) {
                              await DialogHelper.showInformDialog(
                                Text("Gửi đánh giá thành công"),
                              );
                            }
                          },
                          builder: (context, state) {
                            return StarRating(
                              rating: state.stars,
                              onRatingChanged: (stars) {
                                _cubit.setStars(stars);
                              },
                            );
                          },
                        ),
                      ],
                    ),

                    //comment
                    BkTextfield(
                      controller: _commentController,
                      hint: "Viết đánh giá của bạn tại đây",
                      minLines: 12,
                      maxLines: 20,
                      onChange: (comment) => _cubit.setComment(comment),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverToBoxAdapter(
            child: Center(child: BkButton(onPressed: () {_cubit.sendReview();}, title: "Gửi")),
          ),
        ],
      ),
    );
  }
}
