import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mothers_foundation_ngo/screens/ItemsPage/items_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  static Route route() {
    return PageTransition(
      settings: const RouteSettings(name: routeName),
      type: PageTransitionType.rightToLeft,
      child: DashboardScreen(),
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: SingleChildScrollView(
            controller: _controller,
            clipBehavior: Clip.none,
            // headerSliverBuilder: (_, __) {
            //   return [_buildAppBar()];
            // },
            child: _buildDashBoard(),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: kPrimaryBlackColor,
        // floating: true,
        // snap: true,
        automaticallyImplyLeading: false,
        centerTitle: false,
        // pinned: true,
        // elevation: 1,
        toolbarHeight: 7.5.h,
        title: Text(
          "Mothers Foundations",
          style: TextStyle(
            color: kPrimaryWhiteColor,
            fontWeight: FontWeight.bold,
            fontFamily: kFontFamily,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          BorderButton(),
        ]);
  }

  _buildDashBoard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
            width: 90.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get\nInvolved",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "This is how we do community.\nWhereever you are on your faith\n journey, there is a place for you to get\n involved.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    wordSpacing: 5,
                    color: Colors.black87,
                    fontFamily: kFontFamily,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: 45.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffB6F067),
                  Color(0xff3F90CD),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  "What's Our\nMission",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "The acronym MOTHER FOUNDATION stands for Merciful, Organization, Therapy, Health, Empowerment, Resources, Mother Foundation is working children youth family every needy person for their rights , Mother Foundation is generating awareness in between target group for their rights and helping with gorevment systems and different kind of group , Mother Foundation is working for the children youth family survival protection developments and every needy person in all social causes, mother Foundation thought its responsibilities of family and our systems and societies, we believe in these our participation its working forwards building sensitive to societies and systems. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      wordSpacing: 5,
                      color: kPrimaryWhiteColor.withOpacity(0.8),
                      fontFamily: kFontFamily,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kPrimaryWhiteColor),
                          borderRadius: BorderRadius.circular(24)),
                      // backgroundColor: Colors,
                    ),
                    onPressed: () {
                      // widget.controller.nextPage(
                      //     duration: const Duration(milliseconds: 300),
                      //     curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Know More",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: kPrimaryWhiteColor,
                                fontFamily: kFontFamily,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SizedBox(height: 32),
          Container(
            // height: 45.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3, 0.6, 0.9],
                colors: [
                  Color(0xff6DD6D4),
                  Color(0xff4385BB),
                  Color(0xff4AA6BA),
                  Color(0xff4D8DCC),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  "Send Us \n A Message",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                CustomSingleLineTextField(label: "Name"),
                SizedBox(height: 2.h),
                CustomSingleLineTextField(label: "Email"),
                SizedBox(height: 2.h),
                CustomSingleLineTextField(label: "Contact"),
                SizedBox(height: 2.h),
                CustomSingleLineTextField(label: "Subject"),
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
                        // controller: _fullLocationController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryWhiteColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryWhiteColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryWhiteColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryWhiteColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          filled: true,
                          hintText: "Query",
                          hintStyle: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 12.sp,
                              color: kPrimaryWhiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kPrimaryWhiteColor),
                          borderRadius: BorderRadius.circular(24)),
                      // backgroundColor: Colors,
                    ),
                    onPressed: () {
                      // widget.controller.nextPage(
                      //     duration: const Duration(milliseconds: 300),
                      //     curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Send",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: kPrimaryWhiteColor,
                                fontFamily: kFontFamily,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Divider(
            color: Colors.black.withOpacity(0.5),
            thickness: 2,
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Made With",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: kPrimaryBlackColor,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(width: 5),
              CachedNetworkImage(
                  width: 4.w,
                  height: 4.h,
                  imageUrl:
                      "https://cdn-icons-png.flaticon.com/512/833/833472.png"),
              SizedBox(width: 5),
              Text(
                " by",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: kPrimaryBlackColor,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                " Mothers Foundation",
                style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryBlackColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomSingleLineTextField extends StatelessWidget {
  final String label;
  const CustomSingleLineTextField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SizedBox(
          height: 6.h,
          width: 80.w,
          child: TextField(
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: kFontFamily,
            ),
            // controller: _locationController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryWhiteColor,
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryWhiteColor,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryWhiteColor,
                  style: BorderStyle.solid,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryWhiteColor,
                  style: BorderStyle.solid,
                ),
              ),
              filled: true,
              labelText: label,
              labelStyle: TextStyle(
                  fontFamily: kFontFamily,
                  fontSize: 12.sp,
                  color: kPrimaryWhiteColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: kPrimaryWhiteColor),
                borderRadius: BorderRadius.circular(24)),
            backgroundColor: kPrimaryBlackColor,
            elevation: 0),
        onPressed: () {
          // widget.controller.nextPage(
          //     duration: const Duration(milliseconds: 300),
          //     curve: Curves.easeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Donate Now",
              style: TextStyle(
                fontSize: 9.sp,
                color: kPrimaryWhiteColor,
                fontFamily: kFontFamily,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class EventCardWidget extends StatelessWidget {
  final String titleText;
  final String url;
  final VoidCallback onPressed;
  const EventCardWidget(
      {Key? key,
      required this.titleText,
      required this.url,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: kPrimaryBlackColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                        color: kPrimaryBlackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  CachedNetworkImage(width: 20.w, height: 10.h, imageUrl: url)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
