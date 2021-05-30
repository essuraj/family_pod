import 'package:family_pod/core/constants.dart';
import 'package:family_pod/widgets/list_members.dart';
import 'package:family_pod/widgets/tree_view_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget getTab() {
    switch (_selectedIndex) {
      case 0:
        return TreeViewPage();

      case 1:
        return ListMembers();
      default:
        return Container(
          child: Text("Unknown Tab"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.SITE_NAME),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home),
                // selectedIcon: Icon(Icons.home_filled),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.group_outlined),
                // selectedIcon: Icon(Icons.group_outlined),
                label: Text('Family'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Container(
              child: getTab(),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       Get.toNamed(RouteNames.addMemberPage);
      //     },
      //     label: Text("Add a new family member")),
    );
  }
}
