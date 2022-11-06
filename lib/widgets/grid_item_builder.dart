import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cubit.dart';
import '../model/home_model.dart';
import '../shared/constant.dart';
import '../view/product_details_screen.dart';
import 'custom_text.dart';

Widget gridItemBuilder(ProductDataModel model, context) {
  return InkWell(
    borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
    onTap: () {
      navigateTo(context, ProductDetailsScreen(productDataModel: model));
    },
    child: Container(
      height: 200.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            )
          ]),
      padding: const EdgeInsetsDirectional.only(start: 8, top: 15,bottom: 15,end: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: AlignmentDirectional.topStart, children: [
            CachedNetworkImage(
              width: 150.w,
              height: 140.h,
              imageUrl: model.image,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amberAccent,
                    strokeWidth: 1,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            if (model.discount != 0)
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amberAccent.shade200,
                  ),
                  child: customText(
                      text: 'Discount',
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal))
          ]),
          customText(
            maxLines: 3,
            text: model.name,
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
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
                      text: model.price.toString(),
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                if (model.discount != 0)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customText(
                        text: 'EGP',
                        color: Colors.grey.withOpacity(.8),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                      customNumber(
                          text: '${model.oldPrice}',
                          color: Colors.grey.withOpacity(.8),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.ellipsis,
                          textDecoration: TextDecoration.lineThrough),
                      customNumber(
                        text: ' ${model.discount} % OFF',
                        color: Colors.red,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
              ]),
              const Spacer(),
              CircleAvatar(
                radius: 15,
                backgroundColor:AppCubit.get(context).favorites[model.id]?Colors.amberAccent.shade100:Colors.grey,
                child: IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeFavorite(model.id);
                  },
                  icon:const Icon(
                    Icons.favorite_border,
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
    ),
  );
}