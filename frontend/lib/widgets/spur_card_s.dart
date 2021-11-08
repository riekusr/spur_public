import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/controllers/spur_card_s_controller.dart';
import 'package:spur/models/spur_model.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/money_route_string.dart';
import 'package:spur/utils/operator_string.dart';
import 'package:spur/widgets/app_avatar.dart';
import 'package:spur/widgets/display_string_parser.dart';
import 'package:spur/widgets/text.dart';

class SpurCardSmall extends StatelessWidget {
  final Spur spur;

  SpurCardSmall({Key key, this.spur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpurCardSmallController>(
      global: false,
      init: SpurCardSmallController(spur: spur),
      builder: (controller) => InkWell(
        onTap: () {
          controller.goToDetails();
        },
        child: Container(
          width: 410,
          // width: 360,
          decoration: BoxDecoration(
              color: colorGrey1,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: colorGrey1, width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Center(
                child: TextNunito(
                  controller.spur.title,
                  weight: 6,
                  size: 14,
                  letterspacing: -0.5,
                  color: Color(0xFF21252A),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Bluebox
                  //
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 62),
                      decoration: BoxDecoration(
                        color: colorBlue5,
                        border: Border.all(width: 0, color: colorBlue5),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(8),
                        ),
                        // inner box shadow blue box
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.05, 1],
                          colors: [
                            Colors.black.withOpacity(0.2),
                            colorBlue5,
                            colorBlue5
                          ],
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left avatar app image box with white shader background
                            Container(
                                width: 62,
                                // height: 62,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.centerRight,
                                    stops: [0, 0.5],
                                    colors: [
                                      Color(0xFFFFFFFF).withOpacity(0.25),
                                      Color(0xFF72A3C5).withOpacity(0.4)
                                    ],
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AppServiceAvatar(
                                    controller: controller,
                                  ),
                                )),

                            /// Metric Connect
                            Expanded(
                                child: MetricConnectWidget(
                                    controller: controller)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// price box
                  Container(
                    width: 52,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'USD',
                            style: TextStyle(
                                color: colorGrey9,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                          TextNunito(
                            // remove space between balance and $ sign if bigger for layout purpose
                            (controller.spur.balanceRound.length > 3)
                                ? '\$${controller.spur.balanceRound}'
                                : '\$ ${controller.spur.balanceRound}',
                            color: colorGrey9,
                            size: 14,
                            weight: 8,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 360,
                height: 28,
                child: Stack(
                  children: [
                    /// Time left box
                    Positioned(
                      left: 0.4,
                      top: 0,
                      child: Container(
                        width: 94,
                        height: 27.5,
                        decoration: BoxDecoration(
                            color: colorBlue5,
                            border: Border.all(width: 0, color: colorBlue5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8))),
                        child: Center(
                          child: TextNunito(
                            controller.timeLeftString,
                            // 'in 12 days',
                            color: colorGrey4,
                            weight: 3,
                            letterspacing: -0.56,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),

                    /// Money route box
                    Positioned(
                      left: 120,
                      top: 0,
                      child: Container(
                        color: controller.bgTrueMoneyRoute,
                        height: 14,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: textRouteBox(true, controller),

                          // ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 120,
                      top: 14,
                      child: Container(
                        color: controller.bgFalseMoneyRoute,
                        height: 14,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: textRouteBox(false, controller),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 84,
                      top: 0,
                      child: CustomPaint(
                        painter: ShapesPainterTrue(bg: controller.bgTrueBox),
                        child: Container(
                          width: 45,
                          height: 14,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextNunito(
                              // text true
                              controller.textResolveTrue,
                              weight: 6,
                              size: 10,
                              color: controller.textResolveColorTrue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 84,
                      top: 14,
                      child: Container(
                        height: 14,
                        child: CustomPaint(
                          painter:
                              ShapesPainterFalse(bg: controller.bgFalseBox),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextNunito(
                              // text false
                              controller.textResolveFalse,
                              weight: 6,
                              size: 10,
                              color: controller.textResolveColorFalse,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for returning text in money route boxes
Widget textRouteBox(bool route, controller) {
  String string = '';
  // get true or false route
  final _route = route == true
      ? controller.spur.trueMoneyRoute
      : controller.spur.falseMoneyRoute;

  string = stringMoneyRoute(_route, false);

  return TextNunito(
    string,
    weight: 4,
    size: 11,
    letterspacing: -0.56,
    color: route == true
        ? controller.textResolveColorTrue
        : controller.textResolveColorFalse,
  );
}

// Custom shapes for True / False box
class ShapesPainterTrue extends CustomPainter {
  Color bg;
  ShapesPainterTrue({this.bg});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = bg;

    // create a path for box 45 x 14
    var path = Path();
    path.lineTo(40, 0);
    path.lineTo(45, 7);
    path.lineTo(40, 14);
    path.lineTo(10, 14);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ShapesPainterFalse extends CustomPainter {
  Color bg;
  ShapesPainterFalse({this.bg});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = bg;

    // create a path for box 45 x 14
    var path = Path();
    path.moveTo(10, 0);
    path.lineTo(10, 0);
    path.lineTo(40, 0);
    path.lineTo(45, 7);
    path.lineTo(40, 14);
    path.lineTo(0, 14);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MetricConnectWidget extends StatelessWidget {
  final SpurCardSmallController controller;

  const MetricConnectWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check if the spur hold metricconnect data (should always be)
    if (controller.spur.metricConnectSlotA != null) {
      String operatorString =
          getOperatorString(controller.spur.abOperator, 'small');

      return Container(
        margin: EdgeInsets.only(top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DisplayStringParser(
                slot: 'A', card: 'small', spur: controller.spur),
            TextNunito(
              operatorString,
              size: 12,
              color: colorYellow2,
              letterspacing: 1.1,
            ),
            DisplayStringParser(
                slot: 'B', card: 'small', spur: controller.spur),
          ],
        ),
      );
    } else {
      // return empty container if spur doesnthold metricconnect data
      return Container(child: null);
    }
  }
}
