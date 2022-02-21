import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarosel extends StatelessWidget {
  const ImageCarosel(this.imageList, {Key? key}) : super(key: key);
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.h, autoPlay: true),
      items: imageList
          .map((item) => SizedBox(
                child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000.w)),
              ))
          .toList(),
    );
  }
}
