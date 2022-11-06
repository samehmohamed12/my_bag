import 'package:ecommerce_bloc/animation/fade_animation.dart';
import 'package:ecommerce_bloc/bloc/login/login_cubit.dart';
import 'package:ecommerce_bloc/view/auth/register.dart';
import 'package:ecommerce_bloc/view/layout_screen.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../remote_network/cach_helper.dart';
import '../../shared/constant.dart';
import '../../shared/enums.dart';
import '../../widgets/custom_elevited_buttom.dart';
import '../../widgets/custom_form_field.dart';

class LoginScreen extends StatelessWidget {
    LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                navigateAndKill(context, const LayoutScreen());
              });
            } else {
              showToast(msg: state.loginModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        FadeAnimation(1,
                            child: customText(
                                text: 'LOGIN',
                                color: Colors.black,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 50.h,
                        ),
                        FadeAnimation(
                          2,
                          child: customFormField(
                              context: context,
                              controller: emailController,
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
                          3,
                          child: customFormField(
                              context: context,
                              controller: passwordController,
                              label: 'Password',
                              prefix: Icons.lock,
                              isPassword: !cubit.showPassword ? true : false,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password must be filled';
                                }
                                return null;
                              },
                              onSubmit: (value) {
                                if (loginFormKey.currentState!.validate()) {
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  token = CacheHelper.getData('token');
                                }
                              },
                              suffix: cubit.suffixIcon,
                              suffixPressed: () {
                                cubit.changeSuffixIcon(context);
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        state is LoginLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : FadeAnimation(
                                4,
                                child: customElevatedButton(
                                  text: 'LOGIN',
                                  onPressed: () {

                                    if (loginFormKey.currentState!
                                        .validate()) {
                                      LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      token = CacheHelper.getData('token');
                                      print(token);
                                      print('=============');
                                    }
                                  },
                                ),
                              ),
                        FadeAnimation(
                          5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                  text: 'Don\'t have an account?',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, const RegisterScreen());
                                },
                                child: customText(
                                    text: 'Register Now',
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
