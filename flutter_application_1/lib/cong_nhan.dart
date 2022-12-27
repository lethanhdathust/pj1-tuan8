// ignore: camel_case_types
import 'package:flutter_application_1/can_bo.dart';

class CongNhan extends CanBo {
  int degree;
  CongNhan(String address, int age, String genre, this.degree, String name)
      : super(address, age, genre, name);
  @override
  // TODO: implement address
  String get address => super.address;
  @override
  set address(String _address) {
    // TODO: implement address
    super.address = _address;
  }

  @override
  set name(String _name) {
    // TODO: implement name
    super.name = _name;
  }

  @override
  // TODO: implement name
  String get name => super.name;
  @override
  set genre(String _genre) {
    // TODO: implement genre
    super.genre = _genre;
  }

  @override
  // TODO: implement genre
  String get genre => super.genre;
  @override
  // TODO: implement age
  int get age => super.age;
  @override
  set age(int _age) {
    // TODO: implement age
    super.age = _age;
  }
}
