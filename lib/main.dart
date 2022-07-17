import 'package:flutter/material.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/screens/auth/welcome/welcome_screen.dart';
import 'package:uas/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: const WelcomeScreen(),
    );
  }
}
