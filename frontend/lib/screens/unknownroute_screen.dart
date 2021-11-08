import 'package:flutter/material.dart';
import 'package:spur/widgets/template_main.dart';
import 'package:spur/widgets/text.dart';

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateMain(
      screen: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/404.png', scale: 8.5),
            TextNunito('404', size: 18),
            TextNunito('We could not find the page you are looking for',
                size: 14),
          ],
        )),
      ),
    );
  }
}
