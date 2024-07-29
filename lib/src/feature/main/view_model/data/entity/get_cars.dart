// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

List<CarModel> carModelFromJson(String str) => List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
  final int? cityMpg;
  final String? carModelClass;
  final int? combinationMpg;
  final int? cylinders;
  final double? displacement;
  final String? drive;
  final String? fuelType;
  final int? highwayMpg;
  final String? make;
  final String? model;
  final String? transmission;
  final int? year;

  CarModel({
    this.cityMpg,
    this.carModelClass,
    this.combinationMpg,
    this.cylinders,
    this.displacement,
    this.drive,
    this.fuelType,
    this.highwayMpg,
    this.make,
    this.model,
    this.transmission,
    this.year,
  });

  CarModel copyWith({
    int? cityMpg,
    String? carModelClass,
    int? combinationMpg,
    int? cylinders,
    double? displacement,
    String? drive,
    String? fuelType,
    int? highwayMpg,
    String? make,
    String? model,
    String? transmission,
    int? year,
  }) =>
      CarModel(
        cityMpg: cityMpg ?? this.cityMpg,
        carModelClass: carModelClass ?? this.carModelClass,
        combinationMpg: combinationMpg ?? this.combinationMpg,
        cylinders: cylinders ?? this.cylinders,
        displacement: displacement ?? this.displacement,
        drive: drive ?? this.drive,
        fuelType: fuelType ?? this.fuelType,
        highwayMpg: highwayMpg ?? this.highwayMpg,
        make: make ?? this.make,
        model: model ?? this.model,
        transmission: transmission ?? this.transmission,
        year: year ?? this.year,
      );

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    cityMpg: json["city_mpg"],
    carModelClass: json["class"],
    combinationMpg: json["combination_mpg"],
    cylinders: json["cylinders"],
    displacement: json["displacement"]?.toDouble(),
    drive: json["drive"],
    fuelType: json["fuel_type"],
    highwayMpg: json["highway_mpg"],
    make: json["make"],
    model: json["model"],
    transmission: json["transmission"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "city_mpg": cityMpg,
    "class": carModelClass,
    "combination_mpg": combinationMpg,
    "cylinders": cylinders,
    "displacement": displacement,
    "drive": drive,
    "fuel_type": fuelType,
    "highway_mpg": highwayMpg,
    "make": make,
    "model": model,
    "transmission": transmission,
    "year": year,
  };
}
