import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/screens/browse_screen.dart';
import 'package:spur/screens/detail_screen.dart';
import 'package:spur/screens/home_screen.dart';
import 'package:spur/screens/test_screen.dart';
import 'package:spur/screens/unknownroute_screen.dart';
import 'controllers/init_services.dart';
import 'screens/home_screen.dart';

void main() async {
  // before starting app init services (api ect)
  initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'spur',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      unknownRoute:
          GetPage(name: '/notfound', page: () => UnknownRouteScreen()),
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/test', page: () => TestScreen()),
        GetPage(name: '/browse', page: () => BrowseScreen()),
        GetPage(
            name: '/:id',
            page: () {
              var id = Get.parameters['id'];
              if (id == '/')
                return HomeScreen();
              else if (id.contains(RegExp(r'\d{4,8}')))
                return DetailScreen();
              else
                return UnknownRouteScreen();
            }),
      ],
    );
  }
}
