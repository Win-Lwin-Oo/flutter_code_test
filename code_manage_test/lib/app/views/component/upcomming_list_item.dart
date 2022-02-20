import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_manage_test/constant/base_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcommingListItem extends StatelessWidget {
  const UpcommingListItem(
      {Key? key,
      required this.title,
      required this.id,
      required this.isFavourite,
      this.onTap,
      this.updateFavourite,
      required this.image,
      required this.overview})
      : super(key: key);

  final int id;
  final int isFavourite;
  final String image;
  final String title;
  final String overview;
  final Function()? onTap;
  final Function()? updateFavourite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: '$id',
                    child: Container(
                      width: 100,
                      height: 150,
                      margin: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: IMAGE_URI + image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        overview.length > 100
                            ? overview.substring(0, 100) + '...'
                            : overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: updateFavourite,
                        child: Icon(
                          isFavourite == 0
                              ? CupertinoIcons.heart
                              : CupertinoIcons.heart_fill,
                          color: Colors.pink,
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
