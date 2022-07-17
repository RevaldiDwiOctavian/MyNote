import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/rounded_button.dart';
import 'package:uas/views/components/rounded_input_field.dart';
import 'package:uas/views/screens/auth/login/components/already_have_an_account_check.dart';
import 'package:uas/views/screens/auth/login/components/rounded_password_field.dart';
import 'package:uas/views/screens/auth/login/login_screen.dart';
import 'package:uas/views/screens/auth/signup/components/background.dart';

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
              onPressed: () {},
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
