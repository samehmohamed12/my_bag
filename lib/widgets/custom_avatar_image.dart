import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage(
    this.url, {
    Key? key,
    this.radius,
  }) : super(key: key);
  final double? radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius ?? 40.r,
      backgroundImage: NetworkImage(
        url,
      ),
    );
  }
}
