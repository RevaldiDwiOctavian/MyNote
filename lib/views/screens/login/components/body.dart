import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/screens/login/components/background.dart';
import 'package:uas/views/screens/login/components/rounded_input_field.dart';
import 'package:uas/views/screens/signup/signup_screen.dart';

import 'already_have_an_account_check.dart';
import 'rounded_button.dart';
import 'rounded_password_field.dart';

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
            onChanged: (value) {},
            icon: Icons.person,
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            hintText: 'Password',
          ),
          RoundedButton(
            color: kPrimaryColor,
            onPressed: () {},
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
