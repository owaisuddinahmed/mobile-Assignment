import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class SomethingWentWrongWidget extends StatelessWidget {
   const SomethingWentWrongWidget({super.key,required this.onTapRetry });

  final Function() onTapRetry;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 2.h,
      children: [
        Lottie.asset("assets/lottie/connection_error.json"),
        const CustomText(
          text: "Something went wrong..",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        const CustomText(text: "An alien is probably blocking your signal."),
        GestureDetector(
          onTap: onTapRetry,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              height: 5.h,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.green)),
              child: const CustomText(
                text: "RETRY",
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
