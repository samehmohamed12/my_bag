import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

Widget customElevatedButton({
  required String text,
  required Function() onPressed,
  Color color = Colors.black,
}) =>
    SizedBox(
      width: 250.w,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
          backgroundColor: Colors.amberAccent.shade100,
          maximumSize: const Size(360, 50),
        ),
        onPressed: onPressed,
        child: customText(
          fontWeight: FontWeight.w500,
          text: text,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
