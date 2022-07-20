import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:uas/app_config.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/rounded_button.dart';
import 'package:uas/views/components/rounded_input_field.dart';
import 'package:http/http.dart' as http;
import 'package:uas/views/screens/home.dart';

class OpenNote extends StatefulWidget {
  const OpenNote({Key? key}) : super(key: key);

  @override
  State<OpenNote> createState() => _OpenNoteState();
}

class _OpenNoteState extends State<OpenNote> {
  // String id = SpUtil.getInt('id').toString();
  String user_id = SpUtil.getInt('user_id').toString();
  String title = SpUtil.getString('title').toString();
  String body = SpUtil.getString('body').toString();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future updateNote(id) async {
    try {
      EasyLoading.show(status: "Loading...");
      http.Response response = await http.put(
        Uri.parse(AppConfig.apiUrl() + 'mynotes/update/$id'),
        headers: {
          'Accept': 'application/json',
          'authorization': "bearer ${SpUtil.getString('token')}",
        },
        body: {
          'title': titleController.text,
          'body': bodyController.text,
        },
      );
      print(response.body);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        Alert(
          context: context,
          title: "Success",
          desc: "Note updated",
          type: AlertType.success,
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
              width: 120,
            ),
          ],
        ).show();
      } else {
        Alert(
          context: context,
          title: "Error",
          desc: "Something went wrong",
          type: AlertType.error,
        ).show();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    bodyController.text = body;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(SpUtil.getInt('id').toString()),
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: RoundedInputField(
                    hintText: "Title",
                    icon: Icons.edit,
                    onChanged: (value) {
                      title = value;
                    },
                    controller: titleController,
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: bodyController,
                      onChanged: (value) {
                        body = value;
                      },
                      maxLines: 30,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type your note here",
                      ),
                    ),
                  ),
                ),
                Center(
                  child: RoundedButton(
                    color: kPrimaryColor,
                    onPressed: () {
                      updateNote(SpUtil.getInt('id').toString());
                    },
                    text: "Save",
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
