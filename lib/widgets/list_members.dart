import 'package:family_pod/core/routes.dart';
import 'package:family_pod/core/theme.dart';
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
  Member? selectedMember;
  @override
  void initState() {
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: Get.width / 6 < 240 ? 240 : Get.width / 6,
            child: ListView.separated(
                itemBuilder: (_, i) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectedMember = members![i];
                      });
                    },
                    title: Text(members![i].fullName),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider();
                },
                itemCount: members!.length),
          ),
          DefaultTabController(
            length: 3,
            child: Container(
              child: selectedMember != null
                  ? Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              color: Get.theme.cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.account_box_outlined,
                                        size: 128,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        selectedMember!.fullName,
                                        style: Get.textTheme.headline3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: TabBar(tabs: [
                                Tab(text: "Info"),
                                Tab(text: "Events"),
                                Tab(text: "Relationships"),
                              ]),
                            ),
                            Container(
                              //Add this to give height
                              height: MediaQuery.of(context).size.height / 2,
                              child: TabBarView(children: [
                                Container(
                                  child: Text("Home Body"),
                                ),
                                Container(
                                  child: Text("Articles Body"),
                                ),
                                Container(
                                  child: Text("User Body"),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                          color: Get.theme.cardColor,
                          child: Center(child: Text("Select a member"))),
                    ),
            ),
          )
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
