import 'package:flutter/material.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:scube/app/features/dashboard/domain/entity/dashboard_second_entity.dart';

abstract class DeshboardRemoteDataSource {
  Future<DashboardEntity> getDashboardData();
  Future<DashboardSecondEntity> getDashboardSecondData();
}

class DeshboardRemoteDataSourceImpl implements DeshboardRemoteDataSource {
  @override
  Future<DashboardEntity> getDashboardData() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Logic moved from Notifier
    final now = DateTime.now();
    final currentMinutes = now.hour * 60 + now.minute;

    String temperature;
    Color thermometerColor;
    String weatherIcon;
    String thermometerImage;
    Color weatherIconColor;

    if (currentMinutes >= 660 && currentMinutes < 720) {
      // 11:00 AM - 12:00 PM
      temperature = "17";
      thermometerColor = Colors.blue;
      weatherIcon = AppImages.moon;
      weatherIconColor = Colors.amber;
      thermometerImage = AppImages.thermometer;
    } else if (currentMinutes >= 720 && currentMinutes < 780) {
      // 12:00 PM - 01:00 PM
      temperature = "30";
      thermometerColor = Colors.red;
      weatherIcon = AppImages.sun;
      weatherIconColor = Colors.orange;
      thermometerImage = AppImages.thermometer2;
    } else if (currentMinutes >= 870 && currentMinutes < 930) {
      // 02:30 PM - 03:30 PM
      temperature = "19";
      thermometerColor = Colors.teal;
      weatherIcon = AppImages.moon;
      weatherIconColor = Colors.grey;
      thermometerImage = AppImages.thermometer3;
    } else {
      // Default / Fallback
      temperature = "17";
      thermometerColor = Colors.blue;
      weatherIcon = AppImages.morning;
      weatherIconColor = Colors.amber;
      thermometerImage = AppImages.thermometer;
    }

    return DashboardEntity(
      acPower: "10000 kW",
      plantGeneration: "82.58 %",
      livePR: "85.61 %",
      cumulativePR: "27.58 %",
      returnPV: "10000 ৳",
      totalEnergy: "10000 kWh",
      temperature: temperature,
      windSpeed: "26 MPH / NW",
      effectiveIrradiation: "15.20 w/m²",
      thermometerColor: thermometerColor,
      weatherIcon: weatherIcon,
      weatherIconColor: weatherIconColor,
      thermometerImage: thermometerImage,
      yesterdayMaxPower: "1636.50 kW",
      todayMaxPower: "2121.88 kW",
      yesterdayNetEnergy: "6439.16 kWh",
      todayNetEnergy: "4875.77 kWh",
      yesterdaySpecificYield: "1.25 kWh/kWp",
      todaySpecificYield: "0.94 kWh/kWp",
    );
  }

  @override
  Future<DashboardSecondEntity> getDashboardSecondData() async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // Simulate API delay
    return const DashboardSecondEntity(
      totalPower: "5.53 kw",
      electricityLabel: "Electricity",
      donutChartProgress: 0.75,
      dataList: [
        DataListItem(
          title: "Data View",
          status: "Active",
          data1: "55505.63",
          data2: "58805.63",
          type: "solar",
        ),
        DataListItem(
          title: "Data Type 2",
          status: "Active",
          data1: "55505.63",
          data2: "58805.63",
          type: "asset",
        ),
        DataListItem(
          title: "Data Type 3",
          status: "Inactive",
          data1: "55505.63",
          data2: "58805.63",
          type: "power",
        ),
      ],
    );
  }
}
