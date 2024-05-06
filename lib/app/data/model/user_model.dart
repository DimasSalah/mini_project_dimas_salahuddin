class UserModel {
  final String id;
  final String name;
  final String icon;
  final String createdAt;

  UserModel({required this.id, required this.name, required this.icon, required this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ,
      icon: json['icon'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': icon,
      'createdAt': createdAt,
    };
  }
}