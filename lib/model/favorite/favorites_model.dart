class FavoritesModel {
  final bool status;
  String? message;
  Data? data;

  FavoritesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? currentPage;
  List<DataFavorite> data = [];

  Data({
    required this.currentPage,
    required this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(DataFavorite.fromJson(element));
    });
  }
}

class DataFavorite {
  final int id;
  Product? product;

  DataFavorite({
    required this.id,
    this.product,
  });

  factory DataFavorite.fromJson(Map<String, dynamic> json) {
    return DataFavorite(
      id: json['id'],
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }
}

class Product {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
