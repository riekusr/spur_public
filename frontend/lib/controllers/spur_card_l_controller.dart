import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:spur/controllers/template_controller.dart';
import 'package:spur/models/pledge_model.dart';
import 'package:spur/models/spur_model.dart';
import 'dart:async';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/settings.dart';
import 'package:http/http.dart' as http;
import 'package:spur/utils/time_helpers.dart';

import 'api_service.dart';

class SpurCardLargeController extends GetxController {
  Spur spur;
  bool imageLoaded = false;
  ImageProvider spurImage;
  String timeLeftString = '';
  bool pledgeBoxOpen = false;

  APIService apiService = Get.find();
  Map<int, List<Pledge>> pledgesMap = {};
  int totalPledgeCount = 0;
  int pledgeOffset = 0;

  SpurCardLargeController({this.spur});

  @override
  void onInit() {
    getTimer();
    getSpurImage();
    getPledges(offset: pledgeOffset);
  }

  void togglePledgeBox() {
    // ScrollController scrollController = ScrollController();
    //! variable scroll distance depending on pledge list items! and viewport! (check mobile scroll)
    double scrollDistance = 180;
    // get main scroll controller
    ScrollController scrollController =
        Get.find<TemplateController>().scrollController;
    pledgeBoxOpen = !pledgeBoxOpen;
    // scroll down and back up open / closing pledgebox
    pledgeBoxOpen
        ? scrollController.animateTo(scrollDistance,
            duration: Duration(seconds: 2), curve: Curves.ease)
        : scrollController.animateTo(-scrollDistance,
            duration: Duration(seconds: 2), curve: Curves.ease);

    update();
  }

  void getPledges({int offset}) async {
    // print('given offset: $offset');
    try {
      // always make sure offset is positive number and never goes beyond total plegdes
      if (offset.isNegative) {
        offset = 0;
        return;
      } else if (offset > totalPledgeCount) {
        return;
      }
      // if the offset is not yet in the map, create it and fetch from API
      if (!pledgesMap.containsKey(offset)) {
        // print('no key yet');
        // create list in the map with offset as key
        pledgesMap[offset] = [];
        // get pledgeMap from API
        final pledgesMapFromApiService =
            await apiService.getPledges(spur.id, offset);
        // Derrive the count
        totalPledgeCount = pledgesMapFromApiService['count'];
        // Derrive the List with Pledges and add with offset tot he map
        List pledgeListIntermediate = pledgesMapFromApiService['pledges']
          ..forEach((e) => pledgesMap[offset]..add(Pledge.fromJson(e)));
      }

      // print(pledgesMap);

      // Update the global offset
      pledgeOffset = offset;
      update();
    } catch (e) {
      print(e);
    }
  }

  void getTimer() async {
    final countDownTimer = CountDownTimer(spur);
    countDownTimer.timeLeft().listen((event) {
      // print(event);
      timeLeftString = event;
      update();
    });
  }

  void getSpurImage() async {
    // See if spur has own image, otherwise give it placeholder
    var _imageurl = spurImageUri.toString() + spur.id.toString() + '.jpg';
    var response = await http.get(_imageurl);
    if (response.statusCode == 200) {
      spurImage = MemoryImage(response.bodyBytes);
    } else {
      spurImage = AssetImage('/images/spur_image_placeholder.jpg');
    }
    imageLoaded = true;
    update();
  }
}
