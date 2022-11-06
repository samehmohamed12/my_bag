import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/widgets/custom_elevited_buttom.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cubit.dart';
import '../model/home_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productDataModel})
      : super(key: key);
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    FadeAnimation(
                      1,
                      child: CarouselSlider(
                        items: productDataModel.images
                            .map((e) => CachedNetworkImage(
                                  width: double.infinity,
                                  imageUrl: e,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.amberAccent,
                                    strokeWidth: 1,
                                  )),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayInterval: const Duration(seconds: 4),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            enableInfiniteScroll: false,
                            height: 400.h,
                            initialPage: 0,
                            reverse: false,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                            scrollPhysics:
                                const NeverScrollableScrollPhysics()),
                        carouselController: carouselController,
                      ),
                    ),
                    FadeAnimation(
                      2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () =>
                                  carouselController.previousPage(),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                              )),
                          IconButton(
                              onPressed: () => carouselController.nextPage(),
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        3,
                        child: customText(
                            text: productDataModel.name,
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FadeAnimation(
                        4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            customText(
                              text: 'EGP',
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                            customNumber(
                              text: productDataModel.price.toString(),
                              color: Colors.black,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FadeAnimation(
                        5,
                        child: customText(
                          text: productDataModel.description,
                          color: Colors.grey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        FadeAnimation(
          6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  )),
              customElevatedButton(
                text: 'Add to Cart',
                onPressed: () {},
                color:  Colors.grey
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeFavorite(productDataModel.id);
                },
                icon: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      AppCubit.get(context).favorites[productDataModel.id],
                  widgetBuilder: (context) => const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  fallbackBuilder: (context) =>
                      const Icon(Icons.favorite_border_rounded),
                ),
                padding: const EdgeInsets.all(0),
                iconSize: 20,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
