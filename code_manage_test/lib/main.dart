import 'package:code_manage_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MyApp",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
