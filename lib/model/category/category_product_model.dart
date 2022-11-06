import '../home_model.dart';

class CategoryProductModel {
  final bool status;
  Data? data;

  CategoryProductModel({
    required this.status,
    required this.data,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductModel(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? currentPage;
  List<ProductDataModel> data = [];

  Data({
    required this.currentPage,
    required this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(ProductDataModel.fromJson(element));
    });
  }
}

