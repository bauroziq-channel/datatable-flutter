class User {
  int? id;
  String? name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: int.parse(json['id']), name: json['name']);
  }
}
