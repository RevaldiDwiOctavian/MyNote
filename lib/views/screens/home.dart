import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:uas/constant.dart';
import 'package:uas/views/components/profile_info.dart';
import 'package:uas/views/screens/mynote/add_note.dart';
import 'package:uas/views/screens/mynote/my_note.dart';
import 'package:uas/views/screens/publicnote/public_note.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      MyNote(),
      PublicNote(),
    ];
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: kPrimaryColor,
        items: [
          TabItem(icon: Icons.note, title: 'My Note'),
          TabItem(icon: Icons.public, title: 'Public Note'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
      body: Column(
        children: [
          ProfileInfo(
            username: 'User Name',
          ),
          widgets[currentIndex],
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNote();
              },
            ),
          );
        },
        label: const Text(
          'Add Note',
          style: TextStyle(
            color: kPrimaryLightColor,
          ),
        ),
        icon: const Icon(
          Icons.add,
          color: kPrimaryLightColor,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
