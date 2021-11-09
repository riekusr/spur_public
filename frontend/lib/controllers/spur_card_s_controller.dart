import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:spur/models/spur_model.dart';
import 'dart:async';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/settings.dart';
import 'package:spur/utils/time_helpers.dart';

class SpurCardSmallController extends GetxController {
  Spur spur;
  String timeLeftString = "Time left ...";
  Color bgTrueBox = colorGreen2;
  Color bgFalseBox = colorRed2;
  Color bgTrueMoneyRoute;
  Color bgFalseMoneyRoute;
  Color textResolveColorTrue = Colors.black;
  Color textResolveColorFalse = Colors.black;
  String textResolveTrue = 'true';
  String textResolveFalse = 'false';
  ImageProvider appServiceAvatar;
  bool appServiceAvatarLoaded = false;

  SpurCardSmallController({this.spur});

  get http => null;

  @override
  void onInit() {
    getTimer();
    // timeLeft(spur);
    // timeLeft();
    resolvedUI();
    // getAppServiceImage();
  }

  void goToDetails() {
    Get.toNamed('/${spur.id}', arguments: spur);
  }

  void getTimer() async {
    final countDownTimer = CountDownTimer(spur);
    countDownTimer.timeLeft().listen((event) {
      // print(event);
      timeLeftString = event;
      update();
    });
  }


  void resolvedUI() {
    if (spur.resolved == true && spur.resolveError != true) {
      bgTrueBox = colorGreen3;
      bgFalseBox = colorRed1;
      bgTrueMoneyRoute = colorGreen2;
      textResolveColorFalse = colorGrey7;
    } else if (spur.resolved == false && spur.resolveError != true) {
      bgFalseBox = colorRed3;
      bgTrueBox = colorGreen1;
      bgFalseMoneyRoute = colorRed2;
      textResolveColorTrue = colorGrey7;
    } else if (spur.resolved == true && spur.resolveError == true) {
      bgTrueBox = colorYellow2;
      bgFalseBox = colorRed1;
      bgTrueMoneyRoute = colorYellow1;
      textResolveColorFalse = colorGrey7;
      textResolveTrue = 'error';
    } else if (spur.resolved == false && spur.resolveError == true) {
      bgFalseBox = colorYellow2;
      bgTrueBox = colorGreen1;
      bgFalseMoneyRoute = colorYellow1;
      textResolveColorTrue = colorGrey7;
      textResolveFalse = 'error';
    }
  }
}
