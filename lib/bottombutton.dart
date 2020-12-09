import 'package:flutter/material.dart';

import 'constants.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({this.onTap,this.title});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(
          child: Text(title,style: klargebutton,
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomheight,
      ),
    );
  }
}
