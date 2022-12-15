class UserModel {
  final int id;
  final String username;
  final String email;
  final String password;

  UserModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.username});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map["password"] = password;
    return map;
  }

  static fromMap(Map elemant) {}
}
