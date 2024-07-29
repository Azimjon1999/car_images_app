import 'package:flutter/material.dart';

@immutable
sealed class ApiConstants{
  static const duration = Duration(seconds: 60);
  static const apiCars = "/cars";
  static const contentType = "application/json";
  static bool validate(int? statusCode) => statusCode! <= 205;
  static const url = "https://api.api-ninjas.com";
  static const headers = {"x-api-key":"N4Sfls3xRbYCJcCNVrm20g==OIEkHNEhMS7G5kxQ"};

  //paramEmpty
  static Map<String, String> paramEmpty() => const <String, String>{};

 //paramGetModel
  static Map<String, String> paramGetModel({required String model}) =>
      <String, String>{
        "limit": "5",
        "model": model
      };
}