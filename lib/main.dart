import 'package:flutter/material.dart';
import 'package:medcare_user/ui/screen/home_screen.dart';
import 'package:medcare_user/ui/screen/login_screen.dart';
import 'package:medcare_user/ui/screen/forget_screen.dart';
import 'package:medcare_user/ui/screen/history_screen.dart';
import 'package:medcare_user/ui/screen/token_screen.dart';

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
      title: 'UserApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
