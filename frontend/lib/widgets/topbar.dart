import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/custom_icon_icons.dart';

import 'logo.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      color: colorBlueMain,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 16,
              color: colorGrey3,
              icon: Icon(CustomIcon.plus),
              onPressed: () {},
            ),
            Logo(),
            PopupMenuButton(
              offset: Offset(0, 45),
              icon: Icon(Icons.menu, color: colorGrey3),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(child: Text("Home"), value: "/"),
                PopupMenuItem(child: Text("Test"), value: "/test"),
                PopupMenuItem(
                    child: Text("Test param"), value: "/test/Params123"),
                PopupMenuItem(child: Text("404"), value: "/404"),
                PopupMenuItem(child: Text("Browse"), value: "/browse"),
                PopupMenuItem(child: Text("Settings"), value: "/settings"),
              ],
              onSelected: (value) => Get.toNamed(value),
            ),
          ],
        ),
      ),
    );
  }
}
