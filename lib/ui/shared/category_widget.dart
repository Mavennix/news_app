import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String text;

  const Category({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.blue,

        borderRadius: BorderRadius.all(Radius.circular(10.0)),

        // color: Colors.black
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
