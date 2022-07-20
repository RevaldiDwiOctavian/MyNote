import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:uas/app_config.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/card_note.dart';
import 'package:uas/views/screens/publicnote/open_public_note.dart';
import 'package:http/http.dart' as http;

class PublicNote extends StatefulWidget {
  const PublicNote({
    Key? key,
  }) : super(key: key);

  @override
  State<PublicNote> createState() => _PublicNoteState();
}

class _PublicNoteState extends State<PublicNote> {
  List noteList = [];
  String id = SpUtil.getInt('user_id').toString();

  void getMyNote() async {
    try {
      EasyLoading.show(status: "Loading...");
      http.Response response = await http.get(
        Uri.parse(AppConfig.apiUrl() + 'publicnotes/list'),
        headers: {
          'Accept': 'application/json',
          'authorization': "bearer ${SpUtil.getString('token')}",
        },
      );
      EasyLoading.dismiss();
      print(response.body);
      if (response.statusCode == 200) {
        noteList = json.decode(response.body);
        print(noteList[0]['title']);
        setState(() {
          noteList.length;
        });
        //
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
  void initState() {
    super.initState();
    getMyNote();
    setState(() {
      noteList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Note List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Divider(color: Colors.black),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: noteList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OpenPublicNote();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      CardNote(
                        title: noteList[index]['title'],
                        open: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OpenPublicNote();
                              },
                            ),
                          );
                          SpUtil.putInt("id", noteList[index]['id']);
                          SpUtil.putString(
                              "title", '${noteList[index]['title']}');
                          SpUtil.putString(
                              "body", '${noteList[index]['body']}');
                        },
                      ),
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }
}
