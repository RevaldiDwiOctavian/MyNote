import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sp_util/sp_util.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/rounded_button.dart';
import 'package:uas/views/components/rounded_input_field.dart';

class OpenPublicNote extends StatefulWidget {
  const OpenPublicNote({Key? key}) : super(key: key);

  @override
  State<OpenPublicNote> createState() => _OpenPublicNoteState();
}

class _OpenPublicNoteState extends State<OpenPublicNote> {
  String user_id = SpUtil.getInt('user_id').toString();
  String title = SpUtil.getString('title').toString();
  String body = SpUtil.getString('body').toString();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Public Note'),
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
                    onPressed: () {},
                    text: "Save",
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
