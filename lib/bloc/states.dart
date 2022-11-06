import 'package:ecommerce_bloc/model/address/address_model.dart';
import 'package:ecommerce_bloc/model/cart/carts_model.dart';
import 'package:ecommerce_bloc/model/cart/change_cart_model.dart';
import 'package:ecommerce_bloc/model/category/category_model.dart';
import 'package:ecommerce_bloc/model/category/category_product_model.dart';
import 'package:ecommerce_bloc/model/favorite/change_favorite_model.dart';
import 'package:ecommerce_bloc/model/favorite/favorites_model.dart';
import 'package:ecommerce_bloc/model/home_model.dart';

abstract class AppStates {
  const AppStates();
}

class AppInitialState extends AppStates {}

class ChangeSuffixState extends AppStates {}

class ChangeBottomNavState extends AppStates {}

/// GET CATEGORIES STATES
class CategoryLoadingState extends AppStates {}

class CategoryErrorState extends AppStates {}

class CategorySuccessState extends AppStates {
  final CategoryModel categoryModel;

  const CategorySuccessState(this.categoryModel);
}

/// GET CATEGORIES PRODUCTS STATES
class CategoryProductsLoadingState extends AppStates {}

class CategoryProductsErrorState extends AppStates {}

class CategoryProductsSuccessState extends AppStates {
  final CategoryProductModel categoryProductModel;

  const CategoryProductsSuccessState(this.categoryProductModel);
}
/// END CATEGORIES PRODUCTS STATES

/// GET HOME DATA STATES
class HomeDataLoadingState extends AppStates {}

class HomeDataErrorState extends AppStates {}

class HomeDataSuccessState extends AppStates {
  final HomeModel homeModel;

  const HomeDataSuccessState(this.homeModel);
}

/// CHANGE FAVORITES

class ChangeFavoritesLoadingState extends AppStates {}

class ChangeFavoritesManuallySuccessState extends AppStates {}

class ChangeFavoritesErrorState extends AppStates {}

class ChangeFavoritesSuccessState extends AppStates {
  final ChangeFavoriteModel changeFavoriteModel;

  const ChangeFavoritesSuccessState(this.changeFavoriteModel);
}

/// END CHANGE FAVORITES

/// GET FAVORITES

class FavoritesLoadingState extends AppStates {}

class FavoritesErrorState extends AppStates {}

class FavoritesSuccessState extends AppStates {
  final FavoritesModel favoritesModel;

  const FavoritesSuccessState(this.favoritesModel);
}

/// END  GET FAVORITES
/// GET Carts

class CartsLoadingState extends AppStates {}

class CartsErrorState extends AppStates {}

class CartsSuccessState extends AppStates {
  final CartModel cartsModel;

  const CartsSuccessState(this.cartsModel);
}

/// END  GET Cart
/// ///CHANGE CART PRODUCT

class ChangeCartProductLoadingState extends AppStates {}

class ChangeCartProductErrorState extends AppStates {}
class ChangeCartProductManuallySuccessState extends AppStates {}

class ChangeCartProductSuccessState extends AppStates {
  final ChangeCartModel changeCartModel;

  const ChangeCartProductSuccessState(this.changeCartModel);
}

/// END  CHANGE CART PRODUCT
/// DELETE CART PRODUCT

class DeleteCartProductLoadingState extends AppStates {}

class DeleteCartProductErrorState extends AppStates {}

class DeleteCartProductSuccessState extends AppStates {
  final ChangeCartModel changeCartModel;

  const DeleteCartProductSuccessState(this.changeCartModel);
}

/// END  DELETE CART PRODUCT

/// GET ADDRESS STATES

class AddressLoadingState extends AppStates {}

class AddressErrorState extends AppStates {}

class AddressSuccessState extends AppStates {
  final AddressModel addressModel;

  const AddressSuccessState(this.addressModel);
}

/// END  GET ADDRESS STATES

/// LOG OUT

class LogoutLoadingState extends AppStates {}

class LogoutErrorState extends AppStates {}

class LogoutSuccessState extends AppStates {

}

/// END  LOG OUT
