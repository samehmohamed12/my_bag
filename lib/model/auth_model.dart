import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final bool status;
  final String message;
  final DataUser? data;

  const AuthModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataUser.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}

class DataUser extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  const DataUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
    );
  }

  @override
  List<Object> get props => [id, name, email, phone, image, token];
}
