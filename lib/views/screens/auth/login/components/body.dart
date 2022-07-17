import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/rounded_button.dart';
import 'package:uas/views/components/rounded_input_field.dart';
import 'package:uas/views/screens/auth/login/components/background.dart';
import 'package:uas/views/screens/auth/signup/signup_screen.dart';
import 'package:uas/views/screens/home.dart';
import 'package:uas/api/api.dart';
import 'package:http/http.dart' as http;

import 'already_have_an_account_check.dart';
import 'rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String email, password;

  login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Alert(
              context: context,
              title: "Error",
              desc: "Please fill all field",
              type: AlertType.error)
          .show();
    }
    final response = await http.post(
      Uri.parse('https://my-note-api.herokuapp.com/api/login'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      Alert(
              context: context,
              title: "Success",
              desc: "Login Success",
              type: AlertType.success)
          .show();
    } else {
      Alert(
              context: context,
              title: "Error",
              desc: "Login Failed",
              type: AlertType.error)
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.4,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Your email",
            onChanged: (e) => email = e,
            icon: Icons.mail,
            controller: emailController,
          ),
          RoundedPasswordField(
            onChanged: (e) => password = e,
            hintText: 'Password',
            controller: passwordController,
          ),
          RoundedButton(
            color: kPrimaryColor,
            onPressed: () {
              login();
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Home(),
              //   ),
              // );
            },
            text: "LOGIN",
          ),
          SizedBox(height: size.height * 0.03),
          AlreadeyHaveAnAccountCheck(
            login: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignupScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
