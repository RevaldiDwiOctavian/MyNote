import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
import 'package:uas/app_config.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/screens/auth/welcome/welcome_screen.dart';
import 'package:http/http.dart' as http;

class ProfileInfo extends StatelessWidget {
  final username;
  const ProfileInfo({
    Key? key,
    required this.username,
  }) : super(key: key);

  logout(context) async {
    EasyLoading.show(status: "Loading...");
    final response = await http.post(
      Uri.parse(AppConfig.apiUrl() + 'logout'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SpUtil.getString("token")}',
      },
    );
    EasyLoading.dismiss();

    if (response.statusCode == 200) {
      SpUtil.clear();
    }
  }

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
            child: IconButton(
              icon: Icon(Icons.exit_to_app),
              color: kPrimaryColor,
              onPressed: () {
                logout(context);
                SpUtil.clear();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WelcomeScreen();
                }));
              },
            ),
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
        ],
      ),
    );
  }
}
