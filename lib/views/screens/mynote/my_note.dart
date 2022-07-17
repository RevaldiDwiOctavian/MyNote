import 'package:flutter/material.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/card_note.dart';
import 'package:uas/views/screens/mynote/open_note.dart';

class MyNote extends StatelessWidget {
  const MyNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "My Note",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Divider(color: Colors.black),
        ),
        SizedBox(
          height: 20,
        ),
        CardNote(
          title: 'Note title',
          open: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OpenNote();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
