import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/model/home_model.dart';
import 'package:ecommerce_bloc/shared/constant.dart';
import 'package:ecommerce_bloc/view/product_details_screen.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/grid_item_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 40.h,
              backgroundColor: Colors.white,
              title: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.akayaTelivigala(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    hintText: 'what are you looking for ?',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.grey.shade100,
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey.shade50)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey.shade50)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.grey.shade50,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey.shade50)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey.shade50)),
                  ),
                ),
              ),
            ),
            body: cubit.homeModel != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        FadeAnimation(
                          1,
                          child: SizedBox(
                            height: 160.h,
                            child: cubit.homeModel != null
                                ? CarouselSlider(
                                    items: cubit.homeModel!.data.banners
                                        .map((e) => CachedNetworkImage(
                                              width: double.infinity,
                                              imageUrl: e.image,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                color: Colors.amberAccent,
                                                strokeWidth: 1,
                                              )),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ))
                                        .toList(),
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      autoPlayInterval:
                                          const Duration(seconds: 4),
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 1),
                                      enableInfiniteScroll: true,
                                      height: 200,
                                      initialPage: 0,
                                      reverse: false,
                                      scrollDirection: Axis.horizontal,
                                      viewportFraction: 0.8,
                                    ),
                                    carouselController: carouselController,
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.amberAccent,
                                  )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              FadeAnimation(
                                2,
                                child: Row(
                                  children: [
                                    customText(
                                        text: 'Category',
                                        color: Colors.black,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey,
                                          size: 18,
                                        ))
                                  ],
                                ),
                              ),
                              cubit.categoryModel != null
                                  ? FadeAnimation(
                                      3,
                                      child: SizedBox(
                                        height: 110.h,
                                        child: ListView.separated(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                borderRadius: BorderRadius.circular(15),
                                                focusColor: Colors.grey.shade100,
                                                splashColor:Colors.grey.shade200 ,
                                                highlightColor:Colors.grey.shade50 ,
                                                onTap: () {},
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        const CircleAvatar(
                                                          backgroundColor:
                                                              Colors
                                                                  .amberAccent,
                                                          radius: 36,
                                                        ),
                                                        CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            radius: 35,
                                                            child:
                                                                CachedNetworkImage(
                                                              width: 50.w,
                                                              height: 50.h,
                                                              imageUrl: cubit
                                                                  .categoryModel!
                                                                  .data!
                                                                  .data[index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                color: Colors
                                                                    .amberAccent,
                                                                strokeWidth: 1,
                                                              )),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                            )),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    customText(
                                                        text: cubit
                                                            .categoryModel!
                                                            .data!
                                                            .data[index]
                                                            .name,
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.normal)
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                            itemCount: cubit.categoryModel!
                                                .data!.data.length),
                                      ),
                                    )
                                  : const CircularProgressIndicator(
                                      color: Colors.amberAccent,
                                    ),
                              FadeAnimation(
                                3,
                                child: Row(
                                  children: [
                                    customText(
                                        text: 'Deals of the Day',
                                        color: Colors.black,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey,
                                          size: 18,
                                        ))
                                  ],
                                ),
                              ),
                              cubit.homeModel != null
                                  ? FadeAnimation(
                                      4,
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        crossAxisSpacing: 5,
                                        childAspectRatio: .6,
                                        mainAxisSpacing: 10,
                                        children: List.generate(
                                            cubit.homeModel!.data.products
                                                .length,
                                            (index) => gridItemBuilder(
                                                cubit.homeModel!.data
                                                    .products[index],
                                                context)),
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.amberAccent,
                  )));
      },
    );
  }


}
