import 'package:ecommerce_bloc/bloc/states.dart';
import 'package:ecommerce_bloc/model/address/address_model.dart';
import 'package:ecommerce_bloc/model/category/category_model.dart';
import 'package:ecommerce_bloc/model/category/category_product_model.dart';
import 'package:ecommerce_bloc/model/favorite/change_favorite_model.dart';
import 'package:ecommerce_bloc/model/home_model.dart';
import 'package:ecommerce_bloc/remote_network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/cart/carts_model.dart';
import '../model/cart/change_cart_model.dart';
import '../model/favorite/favorites_model.dart';
import '../remote_network/cach_helper.dart';
import '../remote_network/end_point.dart';
import '../shared/constant.dart';
import '../view/auth/login.dart';
import '../view/cart_screen.dart';
import '../view/category/category_screen.dart';
import '../view/home_screen.dart';
import '../view/settings_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  Map<dynamic, dynamic> favorites = {};
  Map<dynamic, dynamic> carts = {};
  int currentIndex = 0;
 final token = CacheHelper.getData('token');

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];
  List<String> titleBar = ['Home', 'Categories', 'My Cart', 'My Account'];

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  /// GET HOME DATA
  HomeModel? homeModel;

  void getHomeData() {
    emit(HomeDataLoadingState());
    print(token);
    print('---------------');
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      homeModel!.data.products.forEach((element) {
        carts.addAll({element.id: element.inCart});
      });
      emit(HomeDataSuccessState(homeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(HomeDataErrorState());
    });
  }

  /// GET CATEGORIES
  CategoryModel? categoryModel;

  void getCategory() {
    emit(CategoryLoadingState());
    DioHelper.getData(url: CATEGORY, token: token).then((value) {

      categoryModel = CategoryModel.fromJson(value.data);
      emit(CategorySuccessState(categoryModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CategoryErrorState());
    });
  }

  CategoryProductModel? categoryProductModel;

  void getCategoryProducts(int categoryId) {
    emit(CategoryProductsLoadingState());
    DioHelper.getData(url: 'categories/$categoryId').then((value) {
      categoryProductModel = CategoryProductModel.fromJson(value.data);
      categoryProductModel!.data!.data.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      categoryProductModel!.data!.data.forEach((element) {
        carts.addAll({element.id: element.inCart});
      });
      emit(CategoryProductsSuccessState(categoryProductModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CategoryProductsErrorState());
    });
  }

  /// CHANGE FAVORITE
  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorite(int? productId) {
    emit(ChangeFavoritesLoadingState());
    favorites[productId] = !favorites[productId];
    emit(ChangeFavoritesManuallySuccessState());
    DioHelper.postData(
        url: FAVORITES,
        token: token,
        data: {'product_id': productId}).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (changeFavoriteModel!.status == false) {
        favorites[productId] = !favorites[productId];
      } else {
        print(changeFavoriteModel!.message);
        getFavorite();
      }
      emit(ChangeFavoritesSuccessState(changeFavoriteModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId];
      emit(ChangeFavoritesErrorState());
      print(error.toString());
    });
  }

  /// GET FAVORITE
  FavoritesModel? favoritesModel;

  void getFavorite() {
    emit(FavoritesLoadingState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(FavoritesSuccessState(favoritesModel!));
    }).catchError((error) {
      emit(FavoritesErrorState());
      print(error.toString());
    });
  }

  /// GET CARTS
  CartModel? cartsModel;

  void getCarts() {
    emit(CartsLoadingState());
    DioHelper.getData(url: CARTS, token: token).then((value) {
      cartsModel = CartModel.fromJson(value.data);
      emit(CartsSuccessState(cartsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CartsErrorState());
    });
  }

  /// DELETE CART
  ChangeCartModel? deleteCartModel;

  void deleteProductCart(int productCartId) {
    emit(DeleteCartProductLoadingState());
    DioHelper.deleteData(url: 'carts/$productCartId', token: token)
        .then((value) {
      deleteCartModel = ChangeCartModel.fromJson(value.data);
      if (deleteCartModel!.status) {
        getCarts();
      }
      print(deleteCartModel!.message);
      emit(DeleteCartProductSuccessState(deleteCartModel!));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteCartProductErrorState());
    });
  }

  ChangeCartModel? changeCartModel;

  void changeProductCart(int productCartId) {
    carts[productCartId] = !carts[productCartId];
    emit(ChangeCartProductManuallySuccessState());
    emit(ChangeFavoritesLoadingState());
    DioHelper.postData(
        url: 'carts',
        token: token,
        data: {'product_id': productCartId}).then((value) {
      if (changeCartModel!.status == false) {
        carts[productCartId] = !carts[productCartId];
      } else {
        print(changeFavoriteModel!.message);
        getCarts();
      }
      changeCartModel = ChangeCartModel.fromJson(value.data);
      emit(ChangeCartProductSuccessState(changeCartModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ChangeCartProductErrorState());
    });
  }

  /// GET ADDRESS
  AddressModel? addressModel;

  void getAddress() {
    emit(AddressLoadingState());
    DioHelper.getData(url: 'addresses', token: token).then((value) {
      addressModel = AddressModel.fromJson(value.data);
      emit(AddressSuccessState(addressModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AddressErrorState());
    });
  }

  void logOut(context) {
    emit(LogoutLoadingState());
    DioHelper.postData(url: 'logout', token: token).then((value) {
      emit(LogoutSuccessState());
      CacheHelper.removeData('token');
      navigateAndKill(context,   LoginScreen());
      currentIndex = 0;
    }).catchError((error) {
      print(error);
      emit(LogoutErrorState());
    });
  }
}
