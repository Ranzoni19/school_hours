// ignore_for_file: file_names, camel_case_types, unused_import

import 'package:flutter/material.dart';

class userModel {
  String? name;
  String? lastname;
  String? email;
  String? password;
  String? turn;
  String? age;
  String? div;

  userModel({
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.turn,
    this.age,
    this.div,
  });

  factory userModel.fromMap(map) {
    return userModel(
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      password: map['password'],
      turn: map['turn'],
      age: map['age'],
      div: map['div'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'turn': turn,
      'age': age,
      'div': div,
    };
  }
}
