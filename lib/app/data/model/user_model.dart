class UserModel {
  final String name;
  final String password;

  UserModel({required this.name, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
    };
  }
}