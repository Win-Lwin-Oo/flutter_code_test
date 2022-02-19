import 'package:flutter/material.dart';
import 'package:state_data_test/constant/color_property.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({Key? key, this.onPressed, required this.title})
      : super(key: key);

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient:
                const LinearGradient(colors: [BTN_START_COLOR, BTN_END_COLOR])),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
