import 'package:busca_cep/modules/home/home_screen.dart';
import 'package:busca_cep/shared/constants.dart';
import 'package:busca_cep/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Busca Cep",
      theme: ThemeData(
        primarySwatch: MaterialColor(0xfffcc107, colorPrimary),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(width: 2, color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 2, color: blueColor),
      )
        )
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomeScreen())
      ],
    );
  }
}

