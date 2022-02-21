import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.imageName, required this.label})
      : super(key: key);

  final String imageName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageName,
          width: 40.w,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.black87, fontSize: 14.sp),
        ),
      ],
    );
  }
}
