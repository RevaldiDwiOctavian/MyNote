import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/screens/login/components/already_have_an_account_check.dart';
import 'package:uas/views/screens/login/components/rounded_button.dart';
import 'package:uas/views/screens/login/components/rounded_input_field.dart';
import 'package:uas/views/screens/login/components/rounded_password_field.dart';
import 'package:uas/views/screens/login/login_screen.dart';
import 'package:uas/views/screens/signup/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            hintText: "Your email",
            icon: Icons.person,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: 'Password',
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
    );
  }
}
