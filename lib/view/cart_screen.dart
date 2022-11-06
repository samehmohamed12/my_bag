import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/widgets/custom_elevited_buttom.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCarts(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return cubit.cartsModel != null &&
                  state is! ChangeCartProductLoadingState
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Badge(
                                borderRadius: BorderRadius.circular(5),
                                badgeColor: Colors.amberAccent.shade100,
                                shape: BadgeShape.square,
                                padding: EdgeInsets.zero,
                                position:
                                    BadgePosition.topEnd(top: 0, end: -15),
                                badgeContent: FadeAnimation(
                                  6,
                                  child: InkWell(
                                    onTap: () {
                                      cubit.deleteProductCart(cubit.cartsModel!
                                          .data!.cartItems[index].id!);
                                    },
                                    child: const SizedBox(
                                      width: 40,
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                child: FadeAnimation(
                                  1,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        FadeAnimation(
                                          2,
                                          child: CachedNetworkImage(
                                            width: 100.w,
                                            height: 100.h,
                                            imageUrl: cubit.cartsModel!.data!
                                                .cartItems[index].product!.image
                                                .toString(),
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
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FadeAnimation(
                                                3,
                                                child: customText(
                                                    text: cubit
                                                        .cartsModel!
                                                        .data!
                                                        .cartItems[index]
                                                        .product!
                                                        .name
                                                        .toString(),
                                                    color: Colors.black,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FadeAnimation(
                                                    4,
                                                    child: customNumber(
                                                        text:
                                                            'EGP ${cubit.cartsModel!.data!.cartItems[index].product!.price}',
                                                        color: Colors.black,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  FadeAnimation(
                                                    5,
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                        customNumber(
                                                            text: cubit
                                                                .cartsModel!
                                                                .data!
                                                                .cartItems[
                                                                    index]
                                                                .quantity
                                                                .toString(),
                                                            color: Colors.black,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: cubit.cartsModel!.data!.cartItems.length),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              customText(
                                  text: 'total price : ',
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold),
                              customNumber(
                                  text: 'EGP ${cubit.cartsModel!.data!.total}',
                                  color: Colors.black,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                          customElevatedButton(
                              text: 'CHECK OUT', onPressed: () {}),
                        ],
                      ),
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
