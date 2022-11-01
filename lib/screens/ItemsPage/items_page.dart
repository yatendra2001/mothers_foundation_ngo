import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_stack/image_stack.dart';
import 'package:mothers_foundation_ngo/screens/login/widgets/standard_elevated_button.dart';
import 'package:mothers_foundation_ngo/widgets/modal_bottom_sheet.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:mothers_foundation_ngo/repositories/user/user_repository.dart';
import 'package:mothers_foundation_ngo/utils/assets_constants.dart';
import 'package:mothers_foundation_ngo/utils/session_helper.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';
import 'package:mothers_foundation_ngo/widgets/flutter_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemsPage extends StatefulWidget {
  static const routeName = '/items-page';

  const ItemsPage({Key? key}) : super(key: key);

  static Route route() {
    return PageTransition(
      settings: const RouteSettings(name: routeName),
      type: PageTransitionType.rightToLeft,
      child: ItemsPage(),
    );
  }

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final ScrollController _controller = ScrollController();
  List<String> itemsTitleList = ["Clothes", "Footwear", "Stationery", "Food"];
  List<String> itemsIconList = [
    "https://cdn-icons-png.flaticon.com/512/1867/1867631.png",
    "https://cdn-icons-png.flaticon.com/512/866/866692.png",
    "https://cdn-icons-png.flaticon.com/512/2997/2997950.png",
    "https://cdn-icons-png.flaticon.com/512/2515/2515150.png",
  ];
  List<int> itemsCountList = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            controller: _controller,
            clipBehavior: Clip.none,
            headerSliverBuilder: (_, __) {
              return [_buildAppBar()];
            },
            body: _buildDashBoard(),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return SliverAppBar(
        backgroundColor: kPrimaryWhiteColor,
        floating: true,
        snap: true,
        automaticallyImplyLeading: false,
        centerTitle: false,
        pinned: true,
        elevation: 1,
        toolbarHeight: 10.h,
        title: Text(
          "Items List",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: kFontFamily,
            fontSize: 22.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: (() {
              customBottomSheet(
                context,
                _donatingGuideMethod(),
              );
            }),
            style: TextButton.styleFrom(primary: kPrimaryBlackColor),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimaryBlackColor)),
              child: const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Typicons.info,
                    color: kPrimaryBlackColor,
                  )),
            ),
          ),
        ]);
  }

  Padding _donatingGuideMethod() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            indent: 38.w,
            endIndent: 38.w,
            thickness: 2,
            color: kPrimaryBlackColor,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Guide To Donating Items",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 15.5.sp,
                  color: kPrimaryBlackColor,
                  fontFamily: kFontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "• You can choose to leave the donation bag at the door or gate for contactless pickup. Please inform the rider for the same when he calls.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 9.5.sp,
                color: kPrimaryBlackColor,
                fontFamily: kFontFamily),
          ),
          const SizedBox(height: 16),
          Text(
            "• Pickup will be done by a 2-Wheeler Rider assigned by one of our partners - DUNZO or Wefast.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 9.5.sp,
                color: kPrimaryBlackColor,
                fontFamily: kFontFamily),
          ),
          const SizedBox(height: 16),
          Text(
            "• Please ensure that the total weight doesn't exceed 10 kgs and the volume can be accommodated in a 2-wheeler.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 9.5.sp,
                color: kPrimaryBlackColor,
                fontFamily: kFontFamily),
          ),
          const SizedBox(height: 16),
          Text(
            "• Please pack the items in a single bag. Only one bag is accepted per request in a two-wheeler but you can raise multiple requests for same slot.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 9.5.sp,
                color: kPrimaryBlackColor,
                fontFamily: kFontFamily),
          ),
          const SizedBox(height: 16),
          Text(
            "• Please keep the items packed and ready for pickup. 🚀",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 9.5.sp,
                color: kPrimaryBlackColor,
                fontFamily: kFontFamily),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  _buildDashBoard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "You can now directly donate items and money to mother foundations",
            style: TextStyle(
              fontSize: 9.sp,
              color: kPrimaryBlackColor.withOpacity(0.4),
            ),
            textAlign: TextAlign.justify,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.separated(
                itemCount: itemsCountList.length + 1,
                shrinkWrap: true,
                separatorBuilder: ((context, index) => SizedBox(
                      height: 16,
                    )),
                itemBuilder: (context, index) => (index ==
                        itemsCountList.length)
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            itemsCountList.add(0);
                            itemsIconList.add(
                                "https://cdn-icons-png.flaticon.com/512/3284/3284471.png");
                            itemsTitleList.add("Miscellaneous");
                          });
                        },
                        icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Add More Items",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: kPrimaryBlackColor,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemsCountList[index] += 1;
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 10.sp,
                                  color: kPrimaryBlackColor.withOpacity(0.8),
                                ),
                              ),
                            ]),
                      )
                    : ListTile(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: kPrimaryBlackColor),
                            borderRadius: BorderRadius.circular(8)),
                        leading: CachedNetworkImage(
                            imageUrl: itemsIconList[index],
                            height: 8.h,
                            width: 8.w),
                        title: Text(
                          itemsTitleList[index],
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: kPrimaryBlackColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        trailing: Container(
                          width: 30.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        itemsCountList[index] -= 1;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 10.sp,
                                      color:
                                          kPrimaryBlackColor.withOpacity(0.8),
                                    )),
                                Text(
                                  itemsCountList[index].toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: kPrimaryBlackColor,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        itemsCountList[index] += 1;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 10.sp,
                                      color:
                                          kPrimaryBlackColor.withOpacity(0.8),
                                    ))
                              ]),
                        ),
                      ),
              ),
              SizedBox(height: 5.h),
              StandardElevatedButton(
                isArrowButton: true,
                labelText: "Continue ",
                onTap: () {},
              ),
              SizedBox(height: 10.h),
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
              ),
            ],
          )
        ],
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
