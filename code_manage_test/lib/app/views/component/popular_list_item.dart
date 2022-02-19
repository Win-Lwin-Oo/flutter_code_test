import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_manage_test/constant/base_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularListItem extends StatelessWidget {
  const PopularListItem(
      {Key? key,
      required this.title,
      required this.image,
      this.onTap,
      required this.id})
      : super(key: key);

  final int id;
  final String title;
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Column(children: [
            Hero(
              tag: 'img_$id',
              child: SizedBox(
                width: 130,
                height: 130,
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
            Text(
              title.length > 22 ? title.substring(0, 22) : title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Icon(CupertinoIcons.heart)
          ]),
        ),
      ),
    );
  }
}
