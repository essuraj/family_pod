import 'package:family_pod/core/theme.dart';
import 'package:flutter/material.dart';

class AddMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(240),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          // splashColor: Colors.blue,
          // highlightColor: Colors.blue,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(240),
                color: AppThemes.primaryColor.withAlpha(10)
                // border: Border.all(color: Colors.grey),
                ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_to_photos_outlined,
                    size: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Add Member"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
