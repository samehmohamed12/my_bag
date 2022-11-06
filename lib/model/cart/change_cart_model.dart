class ChangeCartModel {
  bool status;
  String message;

  ChangeCartModel({required this.status, required this.message});

  factory ChangeCartModel.fromJson(Map<String, dynamic> json) {
    return ChangeCartModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
