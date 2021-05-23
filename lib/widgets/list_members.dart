import 'package:family_pod/core/routes.dart';
import 'package:family_pod/models/db/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class ListMembers extends StatefulWidget {
  @override
  _ListMembersState createState() => _ListMembersState();
}

class _ListMembersState extends State<ListMembers> {
  List<Member>? members;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      getMembers();
    });
  }

  void getMembers() async {
    var resp = await db.getFamilyMembers();
    setState(() {
      members = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (members == null)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: Get.width / 6 < 240 ? 240 : Get.width / 6,
            child: ListView.separated(
                itemBuilder: (_, i) {
                  return ListTile(
                    title: Text(members![i].fullName),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider();
                },
                itemCount: members!.length),
          ),
          Expanded(child: Container())
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(RouteNames.addMemberPage);
          },
          label: Text("Add a new family member")),
    );
  }
}
