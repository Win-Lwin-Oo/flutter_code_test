import 'package:flutter/material.dart';
import 'package:ui_test/views/component/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(this.categoryList, {Key? key}) : super(key: key);
  final List<Map<String, String>> categoryList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var data in categoryList)
          CategoryItem(imageName: data['image']!, label: data['label']!)
      ],
    );
  }
}
