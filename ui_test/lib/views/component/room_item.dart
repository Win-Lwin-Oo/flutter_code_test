import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_test/constant/color_property.dart';

class RoomItem extends StatelessWidget {
  const RoomItem(
      {Key? key,
      required this.imageName,
      required this.title,
      required this.subTitle,
      required this.label,
      required this.currencyUnit,
      required this.price})
      : super(key: key);
  final String imageName;
  final String title;
  final String subTitle;
  final String label;
  final String currencyUnit;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 200.h,
          child: Image.asset(
            imageName,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                ),
              ],
            ),
            SizedBox(width: 10.w),
            Container(
                width: 100.w,
                height: 50.w,
                decoration:
                    BoxDecoration(border: Border.all(color: ASSET_COLOR)),
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
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  currencyUnit,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  '$price',
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          thickness: 2.h,
          height: 50.h,
        ),
      ],
    );
  }
}
