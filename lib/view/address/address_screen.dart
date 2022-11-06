import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/widgets/custom_elevited_buttom.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppCubit()..getAddress(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return cubit.addressModel != null
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FadeAnimation(
                                  1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on_outlined),
                                            customText(
                                                text: cubit.addressModel!.data!
                                                    .data[index].name,
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                InkWell(
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 18,
                                                      ),
                                                      customText(
                                                          text: 'Delete',
                                                          color: Colors.red,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  color: Colors.grey,
                                                  width: 1,
                                                  height: 15,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.edit,
                                                        color: Colors.grey,
                                                        size: 18,
                                                      ),
                                                      customText(
                                                          text: 'Edit',
                                                          color: Colors.grey,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                                text: 'City :    ',
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            customText(
                                                text: cubit.addressModel!.data!
                                                    .data[index].city,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                                text: 'region : ',
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            customText(
                                                text: cubit.addressModel!.data!
                                                    .data[index].region,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                                text: 'details :',
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            customText(
                                                text: cubit.addressModel!.data!
                                                    .data[index].details,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                                text: 'notes :  ',
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            customText(
                                                text: cubit.addressModel!.data!
                                                    .data[index].notes,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 5,
                                ),
                            itemCount: cubit.addressModel!.data!.data.length),
                      ),
                      FadeAnimation(
                        2,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: customElevatedButton(
                              text: 'Add Address', onPressed: () {}),
                        ),
                      ),
                    ],
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
