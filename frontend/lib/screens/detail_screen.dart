import 'package:flutter/material.dart';
import 'package:spur/controllers/detail_controller.dart';
import 'package:spur/models/spur_model.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/custom_icon_icons.dart';
import 'package:spur/widgets/spur_card_l.dart';
import 'package:spur/widgets/template_main.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      global: false,
      init: DetailController(),
      builder: (controller) => TemplateMain(
        screen: Column(
          children: [
            // Title
            DetailTitleSection(),
            // Loading text or SpurCardlarge
            (controller.loading.value == true)
                ? Center(child: Text('loading'))
                : SpurCardLarge(spur: controller.spur),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class DetailTitleSection extends StatelessWidget {
  const DetailTitleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      // bigger screens get bigger title container box.
      height: _screenHeight > 650 ? 120 : 64,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'IMMUTABLE MOTIVATION',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    letterSpacing: 1.25,
                    color: colorGrey7),
              ),
              Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          print('Learn more');
                        },
                        child: Row(
                          children: [
                            Text(
                              'learn more',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: colorGrey7,
                                  letterSpacing: 0.5),
                            ),
                            Icon(CustomIcon.lightbulb, color: colorGrey7)
                          ],
                        )),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          print('quick video');
                        },
                        child: Row(
                          children: [
                            Icon(CustomIcon.player_play_circle,
                                color: colorGrey7),
                            Text(
                              ' quick video',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: colorGrey7,
                                  letterSpacing: 0.5),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 310,
            top: _screenHeight > 650 ? 34 : 15,
            child: Image(
              image: AssetImage('images/moneyflygrey.png'),
              width: 34,
              height: 34,
            ),
          )
        ],
      ),
    );
  }
}
