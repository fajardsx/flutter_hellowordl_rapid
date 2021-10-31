import 'dart:convert';
import 'package:flutter_hello_world/dart_oop/oop/personel.dart';
import 'package:flutter_hello_world/dart_oop/oop/user.dart';

main() {
  print("Hallo Main");
  // Personel personel = Personel();
  // personel.firstName = "fajar";
  // personel.lastName = "mdr";
  // personel.address = "jakarta";
  // personel.birthdate = "11-07-1988";
  // personel.city = "jakarta";
  // personel.zipcode = 11350;
  // personel.image = "";
  // personel.isActive = true;
  Personel personel = Personel.constructor1(
      "fajar", "mdr", "11-7-1988", "kapuas", "jakarta", 1110, "02922029220");
  print('${personel.firstName}');

  personel.setfirstName = "bambang ";
  print('${personel.firstName}');

  final userJson = '{"username":"google","email":"google@gmail.com"}';
  Map<String, dynamic> user = jsonDecode(userJson);

  print(user['username']);
  User otherUser = User.fromJson(user);
  print(otherUser.username);
  print(otherUser.toJson());
}
