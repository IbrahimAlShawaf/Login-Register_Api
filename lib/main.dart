import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_api/view/auth/login_screen.dart';
import 'package:user_api/view/home_page.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Demo Api',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
      ),
      // home: const LoginPage(),
      home: GetStorage().read('token') != null ? const HomePage() : const LoginScreen(),
      // routes: {
      //   '/loginpage': (context) => const LoginPage(),
      //   '/registerpage': (context) => const RegisterPage(),
      //   '/homepage': (context) => const HomePage(),
      // },
    );
  }
}
