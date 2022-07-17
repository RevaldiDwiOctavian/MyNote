import 'package:flutter/material.dart';
import 'package:uas/constant.dart';

class ProfileInfo extends StatelessWidget {
  final String username;
  const ProfileInfo({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryLightColor,
            ),
            child: Icon(Icons.person, color: kPrimaryColor),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            username,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 155,
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: kPrimaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
