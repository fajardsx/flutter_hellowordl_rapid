class Credential {
  String username;
  String password;

  Credential({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
