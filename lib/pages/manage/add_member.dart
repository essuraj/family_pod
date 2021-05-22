import 'package:flutter/material.dart';

class AddMember extends StatefulWidget {
  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Family Member"),
      ),
      body: Container(
        child: Text("Yay"),
      ),
    );
  }
}
