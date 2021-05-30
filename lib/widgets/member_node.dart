import 'package:family_pod/models/db/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberNode extends StatelessWidget {
  final Member member;
  MemberNode(this.member);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.account_box,
                  size: 72,
                ),
                // Image.network(
                //   'https://i.picsum.photos/id/410/600/600.jpg?hmac=1eayLeHTZrgYY8AhdGBGZVBVw9-EdwSG2xSDD5T9i-g',
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),
                Divider(),
                Text(
                  member.fullName,
                  style: Get.textTheme.headline6,
                )
              ],
            ),
          )),
    );
  }
}
