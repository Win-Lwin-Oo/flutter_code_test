import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:state_data_test/constant/color_property.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {Key? key, this.onTap, required this.gender, required this.isSelected})
      : super(key: key);

  final String gender;
  final Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 2 : 0,
        color: isSelected ? Colors.white : BG_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color:
                        isSelected ? CARD_BORDER_COLOR : Colors.transparent)),
            width: 70.w,
            height: 50,
            child: Center(
                child: Text(gender,
                    style: const TextStyle(
                        fontSize: 12,
                        color: CARD_BORDER_COLOR,
                        fontWeight: FontWeight.bold)))),
      ),
    );
  }
}
