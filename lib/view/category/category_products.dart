import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/grid_item_builder.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({Key? key, required this.nameCategory})
      : super(key: key);
  final String nameCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: Colors.white,
        title: customText(
            text: nameCategory,
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return cubit.categoryProductModel != null
              ?
          GridView.count(
            padding:const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  shrinkWrap: true,

                  crossAxisSpacing: 5,
                  childAspectRatio: .6,
                  mainAxisSpacing: 10,
                  children: List.generate(
                      cubit.categoryProductModel!.data!.data.length,
                      (index) => gridItemBuilder(
                          cubit.categoryProductModel!.data!.data[index],
                          context)),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
