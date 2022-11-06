import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({
    Key? key,
    required this.path,
    this.height,
    this.width,
    this.radius,
    this.color,
  }) : super(key: key);

  CustomSvgImage.square({
    Key? key,
    required String path,
    double? height,
    double? width,
    Color? color,
  }) : this(
          key: key,
          path: path,
          height: height ?? 100.h,
          width: width ?? 100.w,
          radius: BorderRadius.circular(8.r),
          color: color,
        );

  CustomSvgImage.icons({
    Key? key,
    required String path,
    Color? color,
    double? height,
    double? width,
  }) : this(
          key: key,
          path: path,
          height: height ??  100.h,
          width: width ?? 100.w,
          radius: BorderRadius.zero,
          color: color,
        );

  final String path;
  final double? height;
  final double? width;
  final Color? color;

  final BorderRadius? radius;

  /// check radius
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: SvgPicture.asset(
        path,
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}
