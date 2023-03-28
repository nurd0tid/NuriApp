import 'package:flutter/material.dart';
import 'package:nuri_app/screens/home/dashboard.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nuri_app/screens/quran/quran.dart';
import 'package:nuri_app/screens/quran/quran_detail.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id');
    return GetMaterialApp(
      title: 'NuriApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),    
    );
  }
}