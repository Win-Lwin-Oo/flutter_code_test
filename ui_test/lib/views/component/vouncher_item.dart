import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_test/constant/color_property.dart';

class VouncherItem extends StatelessWidget {
  const VouncherItem(
      {Key? key,
      this.header,
      required this.title,
      required this.headLabel,
      required this.subLabel,
      required this.currencyUnit,
      required this.price})
      : super(key: key);

  final String? header;
  final String title;
  final String headLabel;
  final String subLabel;
  final String currencyUnit;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 25.h),
        child: DottedBorder(
          color: Colors.grey,
          padding: const EdgeInsets.all(0),
          strokeWidth: 1,
          child: SizedBox(
              width: double.infinity,
              height: 270.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              header != null
                                  ? Text(
                                      '$header',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : const SizedBox(),
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/fnb@3x.png',
                                width: 40.w,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Inclusive of',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 13.sp),
                                  ),
                                  Text(
                                    'Breakfast',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 13.sp),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/discount@3x.png',
                                width: 40.w,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '20% off',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 13.sp),
                                  ),
                                  Text(
                                    'In-Room Service',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 13.sp),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 5.w),
                          Container(
                              width: 100.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: ASSET_COLOR)),
                              child: Center(
                                  child: Text(
                                'View Rates',
                                style: TextStyle(
                                    color: ASSET_COLOR,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )))
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.h,
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                headLabel,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                subLabel,
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                currencyUnit,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '$price',
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: VOUNCHER_BAR_COLOR,
                        height: 35.h,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.rotate(
                                  angle: 99.7,
                                  child: Icon(
                                    CupertinoIcons.paintbrush_fill,
                                    size: 16.sp,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'MEMBERS DEALS',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
