import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'spur',
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontFamily: 'Clab-Bold',
      ),
    ));
  }
}
