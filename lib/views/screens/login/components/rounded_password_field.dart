import 'package:flutter/material.dart';
import 'package:uas/constant.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: GestureDetector(
          child: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: kPrimaryColor,
          ),
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
