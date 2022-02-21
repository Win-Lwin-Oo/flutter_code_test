import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_test/constant/color_property.dart';
import 'package:ui_test/constant/desire_screen_size.dart';
import 'package:ui_test/views/component/category_list.dart';
import 'package:ui_test/views/component/custom_paint/rectangle/custom_rectangle.dart';
import 'package:ui_test/views/component/custom_paint/tab_one/custom_tab_one.dart';
import 'package:ui_test/views/component/custom_paint/tab_one_select/custom_tab_one_select.dart';
import 'package:ui_test/views/component/custom_paint/tab_two/custom_tab_two.dart';
import 'package:ui_test/views/component/custom_paint/tab_two_select/custom_tab_two_select.dart';
import 'package:ui_test/views/component/image_carosel.dart';
import 'package:ui_test/views/component/room_item.dart';
import 'package:ui_test/views/component/vouncher_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> imageList = [
    'assets/images/travel_one.jpeg',
    'assets/images/travel_two.jpeg',
    'assets/images/travel_three.jpeg'
  ];

  final List<Map<String, String>> categoryList = [
    {"image": "assets/images/theme@3x.png", "label": "Amenities"},
    {"image": "assets/images/workout@3x.png", "label": "Facilities"},
    {"image": "assets/images/fnb@3x.png", "label": "F&B"},
    {"image": "assets/images/kidsfamily@3x.png", "label": "Kids/family"},
    {"image": "assets/images/wellness@3x.png", "label": "Wellness"},
  ];

  int selectedTab = 0;

  void selectTab(int tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        designSize: const Size(DESIRE_WIDTH, DESIRE_HEIGHT),
        builder: (() => Scaffold(
              body: SafeArea(
                  child: Column(
                children: [
                  pageHeader(),
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        pageTitle(),
                        SizedBox(
                          height: 15.h,
                        ),
                        currentLocation(),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 230.h,
                          child: Stack(
                            children: [
                              ImageCarosel(imageList),
                              Positioned(
                                  top: 175.h,
                                  left: 240.h,
                                  child: const CustomRectangle(
                                    child: Text(
                                      'See All 2/68',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        CategoryList(categoryList),
                        SizedBox(
                          height: 20.h,
                        ),
                        tabBar(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Visibility(
                            visible: selectedTab == 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Column(
                                children: const [
                                  RoomItem(
                                      imageName:
                                          'assets/images/horizon_one.jpeg',
                                      title: 'Deluxe Twin',
                                      subTitle:
                                          'Twin Single Beds,CableTV, Free Wifi...',
                                      label: 'Avg. Nightly / Room Form',
                                      currencyUnit: 'SGD',
                                      price: 161.42),
                                  RoomItem(
                                      imageName:
                                          'assets/images/horizon_two.jpeg',
                                      title: 'Deluxe Twin',
                                      subTitle:
                                          'Twin Single Beds,CableTV, Free Wifi...',
                                      label: 'Avg. Nightly / Room Form',
                                      currencyUnit: 'SGD',
                                      price: 161.42),
                                ],
                              ),
                            )),
                        Visibility(
                            visible: selectedTab == 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Column(
                                children: const [
                                  VouncherItem(
                                    header: 'YOUR E-VOUNCHER RATE',
                                    title: 'Mobile App Special Vouncher',
                                    headLabel: 'Avg. Nightly / Room From',
                                    subLabel: 'Subject to GST & Service charge',
                                    currencyUnit: 'SGD',
                                    price: 161.42,
                                  ),
                                  VouncherItem(
                                    title: 'Weekend Staycation',
                                    headLabel: 'Avg. Nightly / Room From',
                                    subLabel: 'Subject to GST & Service charge',
                                    currencyUnit: 'SGD',
                                    price: 161.42,
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              )),
            )));
  }

  Widget pageHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back,
            color: ASSET_COLOR,
          ),
          Wrap(
            children: [
              Image.asset(
                'assets/images/currency@3x.png',
                width: 30.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                'assets/images/chatactive@3x.png',
                width: 30.w,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget pageTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                'Furama Riverfront,',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Singapore',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.arrow_forward_ios,
              color: ASSET_COLOR,
              size: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget currentLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '405 Havelock Road, Singapore 169633',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Image.asset(
            'assets/images/currentlocation@3x.png',
            width: 30.w,
          ),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Stack(
        children: [
          GestureDetector(
              onTap: () => selectTab(0),
              child: selectedTab == 0
                  ? CustomTabOneSelect(
                      child: Text(
                        'By Room',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : CustomTabOne(
                      child: Text(
                        'By Room',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
          Positioned(
            left: 162.w,
            child: GestureDetector(
                onTap: () => selectTab(1),
                child: selectedTab == 1
                    ? CustomTabTwoSelect(
                        child: Text(
                          'By Rates',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : CustomTabTwo(
                        child: Text(
                          'By Rates',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
