import 'package:flutter/material.dart';
import 'package:mobile_assignment/app/widgets/shimmer_widget.dart';
import 'package:sizer/sizer.dart';

class TrendingShimmer extends StatelessWidget {
  const TrendingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context,index){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerWidget(
                child: Container(height: 10.h,width: 10.w,

                decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2.h,
                  children: [
                    ShimmerWidget(
                      child: Container(height: 1.h,width: 20.w,
                        decoration:  BoxDecoration(borderRadius:BorderRadius.circular(5) ,color: Colors.white),
                      ),
                    ),
                    ShimmerWidget(
                      child: Container(height: 1.h,width: 50.w,
                        decoration:  BoxDecoration(borderRadius:BorderRadius.circular(5) ,color: Colors.white),

                      ),
                    ),
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
      
    });
  }
}
