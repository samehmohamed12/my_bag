import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ecommerce_bloc/bloc/cubit.dart';
import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          // appBar: AppBar(
          //   title: customText(
          //       text: cubit.titleBar[cubit.currentIndex],
          //       color: Colors.black,
          //       fontSize: 22,
          //       fontWeight: FontWeight.w400),
          //   backgroundColor: Colors.blue.shade900,
          // ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: cubit.currentIndex,
            showElevation: false, // use this to remove appBar's elevation
            onItemSelected: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavyBarItem(
                  icon: const Icon(Icons.home_outlined),
                  title: customText(text: 'Home', color: Colors.amberAccent, fontSize: 16, fontWeight: FontWeight.normal),
                  activeColor: Colors.amberAccent,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: Image.asset(
                    'assets/images/png/menu.png',
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  ),
                  title: const Text(' Category'),
                  activeColor: Colors.amberAccent,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  title: const Text('Cart'),
                  activeColor: Colors.amberAccent,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  activeColor: Colors.amberAccent,
                  inactiveColor: Colors.grey),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
