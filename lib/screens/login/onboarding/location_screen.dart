import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mothers_foundation_ngo/screens/home/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:mothers_foundation_ngo/blocs/auth/auth_bloc.dart';

import 'package:mothers_foundation_ngo/models/user_model.dart';
import 'package:mothers_foundation_ngo/repositories/user/user_repository.dart';
import 'package:mothers_foundation_ngo/screens/login/widgets/standard_elevated_button.dart';
import 'package:mothers_foundation_ngo/utils/session_helper.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';
import 'package:mothers_foundation_ngo/widgets/widgets.dart';

class DobScreen extends StatefulWidget {
  final PageController pageController;

  const DobScreen({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<DobScreen> createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _fullLocationController = TextEditingController();
  bool isButtonNotActive = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    _locationController.text = SessionHelper.age ?? "";
    _locationController.addListener(() {
      final isButtonNotActive = _locationController.text.isEmpty;
      setState(() {
        this.isButtonNotActive = isButtonNotActive;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                Text(
                  "Tell us your location 📍",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: kFontFamily,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  "It will be saved and used for futher donations from your side.",
                  style: TextStyle(
                    fontSize: 10.sp,
                    height: 1.3,
                    fontFamily: kFontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: SizedBox(
                      // height: 8.h,
                      width: 80.w,
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: kFontFamily,
                        ),
                        controller: _locationController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.locationArrow,
                            color: kPrimaryBlackColor.withOpacity(0.8),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          filled: true,
                          hintText: "your location",
                          hintStyle: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 12.sp,
                              color: kPrimaryBlackColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
                SizedBox(height: 2.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: SizedBox(
                      // height: 8.h,
                      width: 80.w,
                      child: TextField(
                        maxLines: 5,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: kFontFamily,
                        ),
                        controller: _fullLocationController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryBlackColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          filled: true,
                          hintText: "Full Address",
                          hintStyle: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 12.sp,
                              color: kPrimaryBlackColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
              ],
            ),
            StandardElevatedButton(
              isArrowButton: true,
              labelText: "Continue",
              onTap: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              isButtonNull: isButtonNotActive,
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
      ),
    );
  }
}
