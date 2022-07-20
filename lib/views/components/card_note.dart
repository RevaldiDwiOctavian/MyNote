import 'package:flutter/material.dart';
import 'package:uas/constant.dart';

class CardNote extends StatelessWidget {
  final title;
  final open;
  final delete;
  const CardNote({
    Key? key,
    required this.title,
    this.open,
    this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: [
                IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: open,
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: delete,
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
