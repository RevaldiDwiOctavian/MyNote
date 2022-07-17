import 'package:flutter/material.dart';
import 'package:uas/constant.dart';

class CardNote extends StatelessWidget {
  final String title;
  final open;
  const CardNote({
    Key? key,
    required this.title,
    this.open,
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
              ElevatedButton.icon(
                icon: Icon(Icons.visibility),
                onPressed: open,
                label: Text('Open'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
