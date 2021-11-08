import 'package:flutter/material.dart';
import 'package:spur/widgets/template_main.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateMain(
      screen: Center(child: Text('browse kut')),
    );
  }
}
