import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:spur/controllers/api_service.dart';
import 'package:spur/models/spur_model.dart';
import 'package:http/http.dart' as http;

class TemplateController extends GetxController {
  ScrollController scrollController;

  TemplateController(this.scrollController);

  // function to pass scrollcontroller and always make sure there is only 1,
//  fopr error:
// "ScrollController attached to multiple scroll views."
//  ! If in problem again, use different scroll controller for each page, maybe create them if not present and store in a Map?
  ScrollController getScrollController() {
    if (scrollController.positions.length > 0) {
      // scrollController.scrollController.dispose();
      // print('diposed scroll controller in template controller');
      scrollController = ScrollController();
    }
    return scrollController;
  }

  @override
  void onInit() async {
    // scrollController = ScrollController();
  }
}
