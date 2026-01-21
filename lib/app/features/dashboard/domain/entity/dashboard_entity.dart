import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DashboardEntity extends Equatable {
  final String acPower;
  final String plantGeneration;
  final String livePR;
  final String cumulativePR;
  final String returnPV;
  final String totalEnergy;
  final String temperature;
  final String windSpeed;
  final String effectiveIrradiation;
  final Color thermometerColor;
  final String weatherIcon;
  final Color weatherIconColor;
  final String thermometerImage;
  final String yesterdayMaxPower;
  final String todayMaxPower;
  final String yesterdayNetEnergy;
  final String todayNetEnergy;
  final String yesterdaySpecificYield;
  final String todaySpecificYield;

  const DashboardEntity({
    required this.acPower,
    required this.plantGeneration,
    required this.livePR,
    required this.cumulativePR,
    required this.returnPV,
    required this.totalEnergy,
    required this.temperature,
    required this.windSpeed,
    required this.effectiveIrradiation,
    required this.thermometerColor,
    required this.weatherIcon,
    required this.weatherIconColor,
    required this.thermometerImage,
    required this.yesterdayMaxPower,
    required this.todayMaxPower,
    required this.yesterdayNetEnergy,
    required this.todayNetEnergy,
    required this.yesterdaySpecificYield,
    required this.todaySpecificYield,
  });

  @override
  List<Object?> get props => [
    acPower,
    plantGeneration,
    livePR,
    cumulativePR,
    returnPV,
    totalEnergy,
    temperature,
    windSpeed,
    effectiveIrradiation,
    thermometerColor,
    weatherIcon,
    weatherIconColor,
    thermometerImage,
    yesterdayMaxPower,
    todayMaxPower,
    yesterdayNetEnergy,
    todayNetEnergy,
    yesterdaySpecificYield,
    todaySpecificYield,
  ];
}
