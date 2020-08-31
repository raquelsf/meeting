import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenteredLabel extends StatelessWidget {
  final String message;

  CenteredLabel({this.message = 'Loading'});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:
      const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Text(
        this.message,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 20,
        ),
      ),
    );
  }
}