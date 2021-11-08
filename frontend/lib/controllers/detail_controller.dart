import 'package:get/get.dart' hide Response;
import 'package:spur/controllers/api_service.dart';
import 'package:spur/models/spur_model.dart';

class DetailController extends GetxController {
  Spur spur;
  APIService apiService = Get.find();
  var loading = true.obs;

  @override
  void onInit() async {
    // Get spur from route or API
    getSpur();
  }

  void getSpur() async {
    // see if spur object came as argument from route
    if (Get.arguments != null) {
      spur = Get.arguments;
      loading.value = false;
    } else {
      // get spur object from APIservice via urlparameter id
      try {
        var spurid = Get.parameters['id'];
        spur = await apiService.getSpurById(spurid);
        loading.value = false;
        // If APIservice fails, keep UI in loading
        if (spur != null) update();
      } catch (e) {
        print(e);
      }
    }
  }
}
