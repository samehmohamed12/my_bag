import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 40.h,
        title: customText(
            text: 'Favorites',
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return cubit.favoritesModel != null &&
                  state is! ChangeFavoritesLoadingState
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                              )
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              width: 150.w,
                              height: 140.h,
                              imageUrl: cubit.favoritesModel!.data!.data[index]
                                  .product!.image,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                strokeWidth: 1,
                              )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text:
                                          'EGP ${cubit.favoritesModel!.data!.data[index].product!.name}',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  customNumber(
                                    text:
                                        'EGP ${cubit.favoritesModel!.data!.data[index].product!.price}',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  customText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      text:
                                          'EGP ${cubit.favoritesModel!.data!.data[index].product!.description}',
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            AppCubit.get(context).favorites[
                                                    cubit
                                                        .favoritesModel!
                                                        .data!
                                                        .data[index]
                                                        .product!
                                                        .id]
                                                ? Colors.amberAccent.shade100
                                                : Colors.grey,
                                        child: IconButton(
                                          onPressed: () {
                                            AppCubit.get(context)
                                                .changeFavorite(cubit
                                                    .favoritesModel!
                                                    .data!
                                                    .data[index]
                                                    .product!
                                                    .id);
                                          },
                                          icon: const Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                          padding: const EdgeInsets.all(0),
                                          iconSize: 20,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            AppCubit.get(context).carts[cubit
                                                    .favoritesModel!
                                                    .data!
                                                    .data[index]
                                                    .product!
                                                    .id]
                                                ? Colors.amberAccent.shade100
                                                : Colors.grey,
                                        child: IconButton(
                                          onPressed: () {
                                            AppCubit.get(context)
                                                .changeProductCart(cubit
                                                    .favoritesModel!
                                                    .data!
                                                    .data[index]
                                                    .product!
                                                    .id);
                                          },
                                          icon: const Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.white,
                                          ),
                                          padding: const EdgeInsets.all(0),
                                          iconSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: cubit.favoritesModel!.data!.data.length)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
