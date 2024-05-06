class UserModel {
  final String id;
  final String name;
  final String icon;

  UserModel({required this.id, required this.name, required this.icon});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ,
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': icon,
    };
  }
}