import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/controllers/template_controller.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/widgets/bottombar.dart';
import 'package:spur/widgets/topbar.dart';

class TemplateMain extends StatelessWidget {
  final Widget screen;
  TemplateMain({Key key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    int _heightTopBottomBar = 60;
    ScrollController _scrollController = ScrollController();
    // template controller to control SCROLL
    final controller =
        Get.put(TemplateController(_scrollController), permanent: true);
    controller.scrollController = _scrollController;
    return Scaffold(
      body: Scrollbar(
        isAlwaysShown: true,
        controller: controller.getScrollController(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/images/backgrounds/colormountaindarken.jpg'),
            ),
          ),
          child:
              // Main topbar / content / bottombar Container
              SingleChildScrollView(
            controller: controller.getScrollController(),
            child: Padding(
              padding: _screenWidth > 700
                  ? const EdgeInsets.only(top: 10, bottom: 10)
                  : const EdgeInsets.only(top: 0, bottom: 0),
              child: Center(
                child: Container(
                  // total max with of content area
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TopBar(),
                      Container(
                          color: colorGrey5,
                          constraints: BoxConstraints(
                              minHeight: _screenWidth > 700
                                  ? _screenHeight - _heightTopBottomBar - 20
                                  : _screenHeight - _heightTopBottomBar),

                          /// Here the page will be rendered!
                          child: screen),
                      BottomBar(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
