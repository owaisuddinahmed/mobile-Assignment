import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_assignment/app/modules/trending/controller/trending_controller.dart';
import 'package:mobile_assignment/app/shimmers/trending_shimmer.dart';
import 'package:mobile_assignment/app/widgets/custom_text.dart';
import 'package:mobile_assignment/app/widgets/something_went_wrong_widget.dart';
import 'package:sizer/sizer.dart';

class TrendingView extends GetWidget<TrendingController> {
  TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(

            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert_outlined),
          )
        ],
        title: const CustomText(
          text: "Trending",
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.grey[400], // Divider color
              height: 0.5, // Divider height
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.showShimmer.value
                  ? const TrendingShimmer()
                  : controller.trendingError.value
                      ? SomethingWentWrongWidget(onTapRetry: () {
                          controller.getTrending();
                        })
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shrinkWrap: true,
                          itemCount: controller.trendingModel.value.items?.length,
                          itemBuilder: (context, index) {
                            var item = controller.trendingModel.value.items?[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover, image: NetworkImage(item?.owner?.avatarUrl ?? '')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 1.h,
                                        children: [
                                          CustomText(
                                            text: item?.owner?.login ?? 'N/A',
                                            fontSize: 14,
                                          ),
                                          CustomText(
                                            text: item?.fullName ?? '',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  color: Colors.grey[400], // Divider color
                                  height: 0.5, // Divider height
                                ),
                              ],
                            );
                          }),
            ),
          )
        ],
      ),
    );
  }
}
