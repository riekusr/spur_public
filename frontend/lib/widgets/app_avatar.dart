import 'package:flutter/material.dart';
import 'package:spur/utils/settings.dart';

class AppServiceAvatar extends StatelessWidget {
  final controller;

  const AppServiceAvatar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      var _imageurl = appAvatarUri.toString() +
          controller.spur.metricConnectSlotA.appService.avatarImage;
      return Container(
          child: Image.network(
        _imageurl,
        fit: BoxFit.fitWidth,
        width: 42,
        height: 42,
      ));
    } catch (e) {
      return Container(
          child: Image.asset(
        'images/blankavatar.png',
        fit: BoxFit.fitWidth,
        width: 42,
        height: 42,
      ));
    }
  }
}
