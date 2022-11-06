import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/shared/constant.dart';
import 'package:ecommerce_bloc/view/address/address_screen.dart';
import 'package:ecommerce_bloc/view/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_avatar_image.dart';
import '../widgets/custom_svg_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          FadeAnimation(
            1,
            child: InkWell(
              onTap: () {
                navigateTo(context, const FavoritesScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5)
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.favorite),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text('My favorites'),
                    const Spacer(),
                    const Icon(Icons.navigate_next_rounded)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          FadeAnimation(
            2,
            child: InkWell(
              onTap: () {
                navigateTo(context, const AddressScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5)
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text('Check my addresses'),
                    const Spacer(),
                    const Icon(Icons.navigate_next_rounded)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          FadeAnimation(
            3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
              ),
              child: Row(
                children: [
                  CustomSvgImage(
                      height: 25.h,
                      width: 25.w,
                      radius: BorderRadius.circular(0),
                      path: 'assets/images/svg/Translation_Arabic.svg'),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('English'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          FadeAnimation(
            4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/png/rotation-lock.png',
                    height: 25.h,
                    width: 25.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Change password'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          FadeAnimation(
            5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Dark Mode'),
                  const Spacer(),
                  Switch(value: false, onChanged: (onChanged) {})
                ],
              ),
            ),
          ),
          const Spacer(),
          FadeAnimation(
            6,
            child: InkWell(
              onTap: (){
                signOut(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
