import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import 'package:mothers_foundation_ngo/screens/login/login_cubit/login_cubit.dart';
import 'package:mothers_foundation_ngo/screens/login/otp_screen.dart';
import 'package:mothers_foundation_ngo/screens/login/widgets/phoneform_widget.dart';
import 'package:mothers_foundation_ngo/screens/login/widgets/standard_elevated_button.dart';
import 'package:mothers_foundation_ngo/utils/session_helper.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  final PageController controller;
  const LoginScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isButtonNotActive = true;

  @override
  void initState() {
    _textEditingController.text =
        SessionHelper.phone?.replaceAll("+91", "") ?? "";
    _textEditingController.addListener(() {
      final isButtonNotActive = _textEditingController.text.length != 10;
      setState(() {
        this.isButtonNotActive = isButtonNotActive;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 4.h),
                  Text(
                    "Sign in with your phone #",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: kFontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 6.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: kPrimaryBlackColor,
                          fontSize: 10.sp,
                          fontFamily: kFontFamily,
                        ),
                        textAlign: TextAlign.center,
                        child: _animatedQuotedTextsMethod(),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  PhoneForm(textEditingController: _textEditingController),
                  SizedBox(height: 12),
                  _termsAndPrivacyPolicy(),
                ],
              ),
              SizedBox(height: 2.h),
              StandardElevatedButton(
                  isArrowButton: true,
                  labelText: "Continue",
                  onTap: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult != ConnectivityResult.none) {
                      widget.controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                      // BlocProvider.of<LoginCubit>(context).sendOtpOnPhone(
                      //     phone: context.read<LoginCubit>().phone);
                      // SessionHelper.phone = context.read<LoginCubit>().phone;
                    } else {
                      Fluttertoast.showToast(
                          msg: 'The Internet connection appears to be offline',
                          backgroundColor: Colors.redAccent);
                    }
                  },
                  isButtonNull: isButtonNotActive),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)),
            ],
          ),
        ),
      ),
    );
  }

  RichText _termsAndPrivacyPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "By continuing you agree to our ",
            style: TextStyle(
                color: kPrimaryBlackColor.withOpacity(0.6),
                fontFamily: kFontFamily,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600),
          ),
          // TextSpan(
          //     text: "Terms",
          //     style: TextStyle(
          //         color: Colors.blue,
          //         fontFamily: kFontFamily,
          //         fontSize: 8.sp,
          //         fontWeight: FontWeight.w600),
          //     recognizer: TapGestureRecognizer()
          //       ..onTap = () {
          //         const url = '';
          //         print("Terms tapped");
          //         // if (await canLaunch(url)) {
          //         //   await launch(url);
          //         // } else {
          //         //   throw 'Could not launch $url';
          //         // }
          //       }),
          // TextSpan(
          //   text: " and ",
          //   style: TextStyle(
          //     color: kPrimaryBlackColor.withOpacity(0.6),
          //     fontFamily: kFontFamily,
          //   ),
          // ),
          TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 8.sp,
                  fontFamily: kFontFamily,
                  fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  const url =
                      'https://docs.google.com/document/d/1I-HN3dkIZPssPKQEi_5tLnNFJq8bQVqFvv6gINBEgbk/edit';
                  print("Terms tapped");
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
        ],
      ),
    );
  }

  AnimatedTextKit _animatedQuotedTextsMethod() {
    return AnimatedTextKit(
      pause: const Duration(seconds: 1),
      repeatForever: true,
      animatedTexts: [
        RotateAnimatedText(
          'The measure of life is not its duration, but its donation.',
          duration: const Duration(seconds: 3),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.5),
        ),
        RotateAnimatedText(
          'Giving a little is better than not giving at all.',
          duration: const Duration(seconds: 3),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.5),
        ),
        RotateAnimatedText(
          'Giving is not just about make a donation, it\'s about making a difference.',
          duration: const Duration(seconds: 3),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.2),
        ),
        RotateAnimatedText(
          'Alone we can do so little; together we can do so much.',
          duration: const Duration(seconds: 3),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
