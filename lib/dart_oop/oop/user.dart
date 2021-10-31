class User {
  String username;
  String email;

  User([this.username = "", this.email = ""]);
  User.fromJson(Map<String, dynamic> jsonvalue)
      : username = jsonvalue["username"],
        email = jsonvalue["email"];
  Map<String, dynamic> toJson() => {'username': username, "email": email};
}
