import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/shared/constant.dart';
import 'package:ecommerce_bloc/view/category/category_products.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                     cubit.getCategoryProducts(
                        cubit.categoryModel!.data!.data[index].id);
                    navigateTo(
                        context,
                        CategoryProductsScreen(
                          nameCategory:
                              cubit.categoryModel!.data!.data[index].name,
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
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
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        FadeAnimation(
                          2,
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: 170.h,
                            imageUrl:
                                cubit.categoryModel!.data!.data[index].image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: Colors.amberAccent,
                              strokeWidth: 1,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        FadeAnimation(
                          1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.4),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(8),
                            child: customText(
                              text: cubit.categoryModel!.data!.data[index].name,
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
            itemCount: cubit.categoryModel!.data!.data.length);
      },
    );
  }
}
