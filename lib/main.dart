import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/remote_network/cach_helper.dart';
import 'package:ecommerce_bloc/remote_network/dio_helper.dart';
import 'package:ecommerce_bloc/shared/constant.dart';
import 'package:ecommerce_bloc/shared/themes.dart';
import 'package:ecommerce_bloc/view/auth/login.dart';
import 'package:ecommerce_bloc/view/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Widget widget;
  await CacheHelper.init();
  token = CacheHelper.getData('token');
  print(token.toString());
  if (token != null) {
    widget = const LayoutScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({super.key, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => AppCubit()
                ..getCategory()
                ..getHomeData()
                ..getFavorite(),

            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode(),
            home: startWidget,
          ),
        );
      },
    );
  }
}
