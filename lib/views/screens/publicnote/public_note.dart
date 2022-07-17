import 'package:flutter/material.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/card_note.dart';
import 'package:uas/views/screens/publicnote/open_public_note.dart';

class PublicNote extends StatelessWidget {
  const PublicNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Public Note",
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
          title: 'Note titleeeee',
          open: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OpenPublicNote();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
