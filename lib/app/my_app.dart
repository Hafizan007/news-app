import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/routes/app_pages.dart';

import '../flavors/build_config.dart';
import '../flavors/env_config.dart';
import 'bindings/initial_binding.dart';
import 'core/values/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: AppColors.colorPrimary,
        textTheme: const TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
