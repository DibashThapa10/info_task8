class UserResponseModel {
  final String success;

  UserResponseModel({required this.success});

  factory UserResponseModel.fromJson({required Map<String, dynamic> json}) {
    return UserResponseModel(success: json["success"]);
  }
}
