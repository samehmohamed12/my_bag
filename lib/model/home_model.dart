class HomeModel {
  final bool status;
  final HomeDataModel data;

  HomeModel({
    required this.status,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
      status: json['status'],
      data: HomeDataModel.fromJson(
        json['data'],
      ));
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductDataModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(ProductDataModel.fromJson(element));
    });
  }
}

class BannerModel {
  final int id;
  final String image;

  BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      BannerModel(id: json['id'], image: json['image']);
}

class ProductDataModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String description;
  final String name;
    bool? inFavorites;
    bool? inCart;
  List<String> images;

  ProductDataModel({
    required this.id,
    required this.images,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
      this.inFavorites,
      this.inCart,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
        description: json['description'],
        images: json['images'].cast<String>(),
      );
}
