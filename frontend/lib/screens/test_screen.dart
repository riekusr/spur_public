import 'package:flutter/material.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/widgets/template_main.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = Get.parameters['id'];
    return TemplateMain(
      screen: Center(
          child: Column(
        children: [
          InkWell(
            onTap: () => Get.snackbar('Title', 'Je dikke pvader'),
            child: Text('Testing  kut, $id'),
          ),
          InkWell(
            onTap: () => Get.defaultDialog(
                onConfirm: () => print("Ok"),
                middleText: "Dialog made in 3 lines of code"),
            child: Text('Testing  kut, $id'),
          ),
          Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: colorBlue5,
                  border: Border.all(width: 0, color: colorBlue5))),
          Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: colorBlue5,
                  border: Border.all(width: 0, color: colorBlue5))),
          Container(color: colorBlue5, height: 200, width: 400),
        ],
      )),
    );
  }
}
