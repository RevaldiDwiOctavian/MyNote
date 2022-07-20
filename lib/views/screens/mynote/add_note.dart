import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:uas/app_config.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/rounded_button.dart';
import 'package:uas/views/components/rounded_input_field.dart';
import 'package:http/http.dart' as http;
import 'package:uas/views/screens/home.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool isPublic = false;
  String token = SpUtil.getString('token').toString();

  Future storeNote() async {
    if (titleController.text.isEmpty || bodyController.text.isEmpty) {
      Alert(
        context: context,
        title: "Error",
        desc: "Please fill all field",
      ).show();
    } else {
      EasyLoading.show(status: "Loading...");
      final response = await http.post(
        Uri.parse(AppConfig.apiUrl() + 'mynotes/create'),
        body: {
          'title': titleController.text,
          'body': bodyController.text,
          'is_public': "true",
          'user_id': SpUtil.getInt('user_id').toString(),
        },
        headers: {
          'Accept': 'application/json',
          'authorization': "bearer $token",
        },
      );
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ),
        );
      } else {
        Alert(
          context: context,
          title: "Error",
          desc: response.body,
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Note'),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: RoundedInputField(
                      hintText: "Title",
                      icon: Icons.edit,
                      onChanged: (value) {},
                      controller: titleController,
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        controller: bodyController,
                        maxLines: 30,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your note here",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RoundedButton(
                      color: kPrimaryColor,
                      onPressed: () {
                        storeNote();
                      },
                      text: "Save",
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
