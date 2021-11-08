import 'package:get/get.dart';
import 'package:spur/controllers/template_controller.dart';

import 'api_service.dart';

void initServices() async {
  print('starting services ...');
  // Here is where you put get_storage, hive, shared_pref initialization.
  // or moor connection, or whatever that's async.
  await Get.putAsync(() => APIService().init());
  print('All services started...');
}
