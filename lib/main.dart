import 'package:flutter/material.dart';
import 'package:user_api/view/home_page.dart';
import 'package:user_api/view/register_screen.dart';

import 'view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Demo Api',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
      ),
      // home: const LoginPage(),
      initialRoute: '/loginpage',
      routes: {
        '/loginpage': (context) => const LoginPage(),
        '/registerpage': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
