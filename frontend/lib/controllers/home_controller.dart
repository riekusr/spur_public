import 'dart:convert';
import 'package:get/get.dart' hide Response;
import 'package:spur/controllers/api_service.dart';
import 'package:spur/models/spur_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<Spur> featured = <Spur>[].obs;

  @override
  void onInit() async {
    APIService apiService = Get.find();
    List<Spur> apiFeatured = await apiService.getFeatured();
    featured.addAll(apiFeatured);
  }
}
