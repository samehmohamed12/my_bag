class CategoryModel {
  final bool status;
  Data? data;

  CategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? currentPage;
  List<DataCategory> data = [];

  Data({
    required this.currentPage,
    required this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(DataCategory.fromJson(element));
    });
  }
}

class DataCategory {
  final int id;
  final String name;
  final String image;

  DataCategory({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DataCategory.fromJson(Map<String, dynamic> json) {
    return DataCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
