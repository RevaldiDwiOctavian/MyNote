import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/screens/auth/welcome/welcome_screen.dart';
import 'package:uas/views/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

isLogin() {
  if (SpUtil.getBool("isLogin") != null && SpUtil.getBool("isLogin") == true) {
    var value = true;
    return value;
  } else {
    var value = false;
    return value;
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: isLogin() ? const Home() : const WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
