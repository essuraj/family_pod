import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "This Page does not exist. ",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
