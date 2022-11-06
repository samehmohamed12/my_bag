import '../home_model.dart';

class AddressModel {
  final bool status;
  Data? data;

  AddressModel({
    required this.status,
    required this.data,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? currentPage;
  List<AddressData> data = [];

  Data({
    required this.currentPage,
    required this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(AddressData.fromJson(element));
    });
  }
}

class AddressData {
  int id;
  String name;
  String city;
  String region;
  String details;
  String notes;

  AddressData({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });


  factory AddressData.fromJson(Map<String, dynamic> map) {
    return AddressData(
      id: map['id'] ,
      name: map['name']  ,
      city: map['city'] ,
      region: map['region']  ,
      details: map['details'] ,
      notes: map['notes']  ,
    );
  }
}
