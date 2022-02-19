import 'package:code_manage_test/app/models/movie_model.dart';
import 'package:code_manage_test/app/routes/app_pages.dart';
import 'package:code_manage_test/app/views/component/popular_list_item.dart';
import 'package:code_manage_test/constant/desire_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'component/upcomming_list_item.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(DESIRE_WIDTH, DESIRE_HEIGHT),
        builder: () => Scaffold(
            body: Obx(() => SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(children: [
                      Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Popular Movies',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              controller.isPopularLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Flexible(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .popularMovieList.length,
                                          itemBuilder: (context, index) {
                                            Movie popularMovie = controller
                                                .popularMovieList[index];
                                            return PopularListItem(
                                              id: popularMovie.id!,
                                              title: popularMovie.title!,
                                              image: popularMovie.posterPath!,
                                              onTap: () {
                                                Get.toNamed(Routes.MOVIE_DETAIL,
                                                    arguments: {
                                                      'image': popularMovie
                                                          .posterPath!,
                                                      'title':
                                                          popularMovie.title!,
                                                      'overview': popularMovie
                                                          .overview!,
                                                      'heroTag':
                                                          'img_${popularMovie.id!}'
                                                    });
                                              },
                                            );
                                          }),
                                    )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Upcomming Movies',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              controller.isUpcomingLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Flexible(
                                      child: ListView.builder(
                                          itemCount: controller
                                              .upcomingMovieList.length,
                                          itemBuilder: (context, index) {
                                            Movie upcommingMovie = controller
                                                .upcomingMovieList[index];
                                            return UpcommingListItem(
                                              id: upcommingMovie.id!,
                                              title: upcommingMovie.title!,
                                              image: upcommingMovie.posterPath!,
                                              overview:
                                                  upcommingMovie.overview!,
                                              onTap: () {
                                                Get.toNamed(Routes.MOVIE_DETAIL,
                                                    arguments: {
                                                      'image': upcommingMovie
                                                          .posterPath!,
                                                      'title':
                                                          upcommingMovie.title!,
                                                      'overview': upcommingMovie
                                                          .overview!,
                                                      'heroTag':
                                                          'img_${upcommingMovie.id!}'
                                                    });
                                              },
                                            );
                                          }),
                                    )
                            ],
                          )),
                    ]),
                  ),
                ))));
  }
}
