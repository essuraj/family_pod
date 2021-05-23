import 'package:faker/faker.dart';
import 'package:family_pod/main.dart';
import 'package:flutter/material.dart';
import 'package:family_pod/models/db/db.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddMemberPage extends StatefulWidget {
  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  var faker = new Faker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Family Member"),
        actions: [
          IconButton(
              onPressed: () async {
                await db.addAFamilyMember(
                    MembersCompanion.insert(fullName: faker.person.name()));
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        child: Text("Yay"),
      ),
    );
  }
}
