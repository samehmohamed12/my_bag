import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cubit.dart';
import '../../remote_network/cach_helper.dart';
import '../../shared/constant.dart';
import '../../shared/enums.dart';
import '../../widgets/custom_elevited_buttom.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/custom_text.dart';
import '../layout_screen.dart';
import 'login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    var signUpFormKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState)
          // ignore: curly_braces_in_flow_control_structures
          if (state.signUpUserModel.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.signUpUserModel.data?.token,
            ).then((value) {
              token = state.signUpUserModel.data?.token;
              name.clear();
              phone.clear();
              email.clear();
              password.clear();
              confirmPassword.clear();
              navigateAndKill(context, const LayoutScreen());
              AppCubit.get(context).currentIndex = 0;
              AppCubit.get(context).getHomeData();
              AppCubit.get(context).getFavorite();
              AppCubit.get(context).getCategory();
              AppCubit.get(context).getCarts();
            });
          } else {
            showToast(
                msg: state.signUpUserModel.message, state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: signUpFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        FadeAnimation(
                          1,
                          child: customText(
                            color: Colors.black,
                            text: 'REGISTER',
                            fontWeight: FontWeight.w400,
                            fontSize: 35,
                          ),
                        ),
                        FadeAnimation(
                          2,
                          child: customFormField(
                              context: context,
                              controller: name,
                              label: 'Name',
                              prefix: Icons.person,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Name field is required';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeAnimation(
                          3,
                          child: customFormField(
                              context: context,
                              controller: phone,
                              label: 'Phone',
                              keyboardType: TextInputType.phone,
                              prefix: Icons.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone field is required';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeAnimation(
                          4,
                          child: customFormField(
                              context: context,
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              label: 'Email',
                              prefix: Icons.email,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Email Address must be filled';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeAnimation(
                          5,
                          child: customFormField(
                              context: context,
                              controller: password,
                              label: 'Password',
                              prefix: Icons.lock,
                              isPassword: cubit.showPassword ? true : false,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password must be filled';
                                }
                                return null;
                              },
                              onSubmit: (value) {},
                              suffix: cubit.suffixIcon,
                              suffixPressed: () {
                                cubit.changeSuffixIcon(context);
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeAnimation(
                          6,
                          child: customFormField(
                              context: context,
                              controller: confirmPassword,
                              label: 'Confirm Password',
                              prefix: Icons.lock,
                              isPassword:
                                  cubit.showConfirmPassword ? false : true,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Confirm password field is required';
                                } else if (value != password.text) {
                                  return 'Password Don\'t Match';
                                }
                                return null;
                              },
                              suffix: cubit.confirmSuffixIcon,
                              suffixPressed: () {
                                cubit.changeConfirmSuffixIcon(context);
                              }),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        state is RegisterLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : FadeAnimation(
                                7,
                                child: customElevatedButton(
                                    onPressed: () {
                                      if (signUpFormKey.currentState!
                                          .validate()) {
                                        cubit.signUp(
                                            name: name.text,
                                            phone: phone.text,
                                            email: email.text,
                                            password: password.text);
                                      }
                                    },
                                    text: 'Sign Up'),
                              ),
                        SizedBox(
                          height: 2.h,
                        ),
                        FadeAnimation(
                          8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                  text: 'Already have any account?',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context,   LoginScreen());
                                },
                                child: customText(
                                    text: 'Sign In',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
