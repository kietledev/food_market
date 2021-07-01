class UserModel {
  String? userId = '';
  String? fullName = '';
  String? email = '';
  String? phone = '';
  String? address = '';
  String? role = '';
  String? createAt = '';
  String? updateAt = '';
  String? token = '';
  UserModel(
      {this.userId,
      this.fullName,
      this.email,
      this.phone,
      this.address,
      this.role,
      this.createAt,
      this.updateAt,
      this.token});
  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    return UserModel(
        userId: jsonMap['userId'],
        fullName: jsonMap['fullName'],
        email: jsonMap["email"],
        phone: jsonMap['phone'],
        address: jsonMap['address'],
        role: jsonMap['role'],
        createAt: jsonMap['createAt'],
        updateAt: jsonMap['updateAt'],
        token: jsonMap['token']);
  }
}
