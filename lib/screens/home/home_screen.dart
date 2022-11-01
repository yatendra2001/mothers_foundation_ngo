import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mothers_foundation_ngo/screens/ItemsPage/items_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return PageTransition(
      settings: const RouteSettings(name: routeName),
      type: PageTransitionType.rightToLeft,
      child: HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

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
      centerTitle: true,
      pinned: true,
      elevation: 1,
      toolbarHeight: 10.h,
      title: Text(
        "Mothers Foundations",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: kFontFamily,
          fontSize: 22.sp,
        ),
      ),
    );
  }

  List<String> images = [
    "https://images.unsplash.com/photo-163335.h755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=487",
    "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
    "https://cxl.com/wp-content/uploads/2016/03/nate_munger.png"
  ];

  _buildDashBoard() {
    bool hideOngoingEvent = false;
    bool hideUpComingEvent = false;

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
              SizedBox(
                height: 5.h,
              ),
              EventCardWidget(
                titleText: "Donate Money",
                url: "https://cdn-icons-png.flaticon.com/512/3135/3135706.png",
                onPressed: () {},
              ),
              SizedBox(
                height: 5.h,
              ),
              EventCardWidget(
                titleText: "Donate Items",
                url: "https://cdn-icons-png.flaticon.com/512/743/743007.png",
                onPressed: () {
                  Navigator.of(context).pushNamed(ItemsPage.routeName);
                },
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
