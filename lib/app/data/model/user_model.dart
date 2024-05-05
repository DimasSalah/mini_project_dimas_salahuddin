class UserModel {
  final String name;
  final String password;
  final String createdAt;

  UserModel({required this.name, required this.password, required this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'created_at': createdAt,
    };
  }
}