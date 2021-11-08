import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/controllers/home_controller.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/custom_icon_icons.dart';
import 'package:spur/widgets/spur_card_s.dart';
import 'package:spur/widgets/template_main.dart';
import 'package:spur/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateMain(
      screen: Column(
        children: [
          HomeTitleSection(),
          HomeFeaturedSection(),
          HomeStatSection(),
          HomeEbookSection(),
        ],
      ),
    );
  }
}

// ### Section widgets
class HomeTitleSection extends StatelessWidget {
  const HomeTitleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(color: colorGrey3, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3))
      ]),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SKIN IN THE GAME',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    letterSpacing: 1.25,
                    color: colorGrey8),
              ),
              Container(
                height: 69,
                child: Text(
                  '''
Connect app metrics to money 
transfers. Spur yourself and others 
with a incentive. 
                    ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 1.25,
                    color: colorGrey8,
                  ),
                ),
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
                                  color: colorGrey8,
                                  letterSpacing: 0.5),
                            ),
                            Icon(CustomIcon.lightbulb)
                          ],
                        )),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          print('watch video');
                        },
                        child: Row(
                          children: [
                            Icon(CustomIcon.player_play_circle),
                            Text(
                              ' quick video',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: colorGrey8,
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
            left: 320,
            top: 29,
            child: Image(
              image: AssetImage('images/moneyfly.png'),
              width: 34,
              height: 34,
            ),
          )
        ],
      ),
    );
  }
}

class HomeFeaturedSection extends StatelessWidget {
  const HomeFeaturedSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Container(
      width: double.infinity,
      height: 430,
      alignment: Alignment.topCenter,
      child: Container(
        // width: 360,
        // This is the max width of the spurcard in the featured list, if you want
        // to reduce size of cards irrespectable of this width, wrap in container in listviewbuilder
        constraints: BoxConstraints(maxWidth: 430),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 14, 10, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured spurs',
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.underline,
                      decorationColor: colorGrey6,
                      shadows: [
                        Shadow(color: colorGrey8, offset: Offset(0, -3))
                      ],
                    ),
                  ),
                  Icon(CustomIcon.options, color: colorGrey8, size: 20),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.featured.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print(controller.featured[index].dateResolve);
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 14),
                      child: SpurCardSmall(spur: controller.featured[index]),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeStatSection extends StatelessWidget {
  const HomeStatSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorGrey3,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        // width: 360,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: InkWell(
              onTap: () {
                print('Navigation to spurs');
              },
              child: Text(
                'Browse spurs',
                style: TextStyle(
                  color: Colors.transparent,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  decoration: TextDecoration.underline,
                  decorationColor: colorGrey6,
                  shadows: [Shadow(color: colorGrey8, offset: Offset(0, -3))],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatSectionMetric(title: '207', label: 'total spurs'),
                StatSectionMetric(title: '68', label: 'active'),
                StatSectionMetric(title: '\$ 1152', label: 'at stake'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class HomeEbookSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/ebook.png', scale: 1.1),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextNunito(
                    'INSPIRATION',
                    size: 16,
                    weight: 8,
                    letterspacing: 1.25,
                  ),
                  SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                        color: colorGreen4,
                        borderRadius: BorderRadius.circular(4)),
                    width: 130,
                    height: 27,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CustomIcon.send, color: Colors.white, size: 20),
                        SizedBox(width: 6),
                        TextNunito('GET E-BOOK', color: Colors.white, size: 12),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  TextNunito('free', size: 12)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//? Single local widgets
class StatSectionMetric extends StatelessWidget {
  final String title;
  final String label;
  StatSectionMetric({this.title, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: colorGrey8,
                letterSpacing: 0.5),
          ),
          Text(label),
        ],
      ),
    );
  }
}
