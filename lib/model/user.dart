class User {
  final String id;
  final String email;
  final String name;
  final String avatar;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'].toString(),
        email: json['email'],
        name: json['first_name'] + " " + json['last_name'],
        avatar: json['avatar']);
  }
}
