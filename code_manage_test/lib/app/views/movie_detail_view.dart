import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_manage_test/constant/base_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 1,
            child: Stack(
              children: [
                Hero(
                  tag: Get.arguments['heroTag'],
                  child: SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl: IMAGE_URI + Get.arguments['image'],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 50.h,
                    left: 16.h,
                    width: 40.w,
                    height: 40.w,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150),
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  width: 60,
                  height: 60,
                  top: 360.h,
                  left: 320.w,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${Get.arguments['title']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${Get.arguments['overview']}',
                        style: const TextStyle(fontSize: 18),
                      )),
                ],
              ),
            ))
      ]),
    );
  }
}
