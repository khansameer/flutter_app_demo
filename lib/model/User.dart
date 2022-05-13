class User {
  final int? id;
  final String name;
  final String? email;
  User(
      { this.id,
        required this.name,
        this.email});
  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        email = res["email"];
  Map<String, Object?> toMap() {
    return {'id':id,'name': name, 'email': email};
  }
}