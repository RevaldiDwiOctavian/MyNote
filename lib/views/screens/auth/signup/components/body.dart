import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uas/app_config.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/rounded_button.dart';
import 'package:uas/views/components/rounded_input_field.dart';
import 'package:uas/views/screens/auth/login/components/already_have_an_account_check.dart';
import 'package:uas/views/screens/auth/login/components/rounded_password_field.dart';
import 'package:uas/views/screens/auth/login/login_screen.dart';
import 'package:uas/views/screens/auth/signup/components/background.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      Alert(
        context: context,
        title: "Error",
        desc: "Please fill all field",
        type: AlertType.error,
      ).show();
    } else {
      EasyLoading.show(status: "Loading...");
      final response = await http.post(
        Uri.parse(AppConfig.apiUrl() + 'register'),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
        headers: {
          'Accept': 'application/json',
        },
      );
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        Alert(
          context: context,
          title: "Success",
          desc: "Register Success",
          type: AlertType.success,
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) {
                  return LoginScreen();
                })));
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          title: "Error",
          desc: "Register Failed",
          type: AlertType.error,
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Signup",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Name",
              icon: Icons.person,
              onChanged: (value) {},
              controller: nameController,
            ),
            RoundedInputField(
              hintText: "Your email",
              icon: Icons.mail,
              onChanged: (value) {},
              controller: emailController,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hintText: 'Password',
              controller: passwordController,
            ),
            RoundedButton(
              color: kPrimaryColor,
              onPressed: () {
                register();
              },
              text: "SIGNUP",
            ),
            SizedBox(height: size.height * 0.03),
            AlreadeyHaveAnAccountCheck(
              login: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
