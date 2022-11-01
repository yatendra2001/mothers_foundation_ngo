import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:mothers_foundation_ngo/screens/dashboard/dashboard_screen.dart';
import 'package:mothers_foundation_ngo/utils/assets_constants.dart';
import 'package:sizer/sizer.dart';

import 'package:mothers_foundation_ngo/screens/login/widgets/standard_elevated_button.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';

class WelcomeScreen extends StatefulWidget {
  final PageController controller;

  const WelcomeScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryWhiteColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 18.h),
              Image.asset(
                kNgoLogo,
                filterQuality: FilterQuality.high,
              ),
              // Image.asset(
              //   kNgoLogo2,
              // ),
              SizedBox(height: 12.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kPrimaryBlackColor),
                          borderRadius: BorderRadius.circular(24)),
                      backgroundColor: kPrimaryWhiteColor,
                      elevation: 0),
                  onPressed: () {
                    widget.controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8.5.w, right: 8.5.w, top: 1.4.h, bottom: 1.4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Login to Donate",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: kPrimaryBlackColor,
                            fontFamily: kFontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (true) const SizedBox(width: 5),
                        if (true)
                          Icon(
                            LineariconsFree.arrow_right,
                            color: kPrimaryBlackColor,
                            size: 14.sp,
                          )
                      ],
                    ),
                  ),
                ),
              ),
              StandardElevatedButton(
                isArrowButton: true,
                labelText: "Continue to Dashboard ",
                onTap: () {
                  Navigator.of(context).pushNamed(DashboardScreen.routeName);

                  // widget.controller.nextPage(
                  //     duration: const Duration(milliseconds: 300),
                  //     curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
