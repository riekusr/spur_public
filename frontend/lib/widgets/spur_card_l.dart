import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spur/controllers/spur_card_l_controller.dart';
import 'package:spur/models/pledge_model.dart';
import 'package:spur/models/spur_model.dart';
import 'package:spur/models/spur_money_route_model.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/custom_icon_icons.dart';
import 'package:spur/utils/money_route_string.dart';
import 'package:spur/utils/operator_string.dart';
import 'package:spur/utils/time_helpers.dart';
import 'package:spur/widgets/app_avatar.dart';
import 'package:spur/widgets/dialogs/dialog_add_pledge.dart';
import 'package:spur/widgets/dialogs/dialog_money_route_details.dart';
import 'package:spur/widgets/dialogs/diaglaog_card_l_appinfo.dart';
import 'package:spur/widgets/display_string_parser.dart';
import 'package:spur/widgets/text.dart';
import 'package:transparent_image/transparent_image.dart';

class SpurCardLarge extends StatelessWidget {
  final Spur spur;

  SpurCardLarge({Key key, this.spur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _uiWidth = 430;
    // print(_screenWidth);
    // print(context.size.height);

    return GetBuilder<SpurCardLargeController>(
        global: false,
        init: SpurCardLargeController(spur: spur),
        builder: (controller) => Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  // Give +6 px for the balance box to overhang over the right
                  constraints: BoxConstraints(maxWidth: _uiWidth + 6),
                ),
                Padding(
                  // Padding to give the bottom transaction button room to go below the cardW
                  padding: const EdgeInsets.only(bottom: 17),
                  child: Container(
                    // main container
                    // width: _uiWidth,
                    constraints: BoxConstraints(maxWidth: _uiWidth),
                    decoration: BoxDecoration(
                        color: colorGrey1,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400],
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 3)),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Container(
                            height: 32,
                            // width: double.infinity,
                            child: Center(
                                child: TextNunito(controller.spur.title))),

                        /// Image box
                        Container(
//! creat fix for the jump after image is loaded, make placeholder before image loaded same size as image (should be easy)
                            // give minimal height so it is not collapsed without image
                            constraints: BoxConstraints(minHeight: 204),
                            // Controller checks if image exists and passes image down
                            child: controller.imageLoaded
                                ? FadeInImage(
                                    placeholder: MemoryImage(kTransparentImage),
                                    image: controller.spurImage)
                                : null),

                        /// Dynamic Middle section App and money route
                        Stack(
                          // no clip behavior to push avatar outside the section
                          clipBehavior: Clip.none,
                          children: [
                            /// Main section in stack, other section is overlay fora vatar and blue line
                            Container(
                              child: Column(
                                children: [
                                  /// App connect box (blue box)
                                  Container(
                                      // height: 130, // was 100
                                      constraints:
                                          BoxConstraints(minHeight: 130),
                                      decoration: BoxDecoration(
                                        color: colorBlue5,
                                        // Hack, set border to blue to hide flutter antialias BUG
                                        border: Border.all(
                                            width: 0, color: colorBlue5),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            right: 6,
                                            left: 7,
                                            bottom: 6),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              Container(
                                                  color: colorBlue7,
                                                  child: TextNunito(
                                                    ' if ',
                                                    size: 15,
                                                    weight: 7,
                                                    color: colorGrey1,
                                                  )),
                                              SizedBox(width: 10),
                                              Flexible(
                                                  child: InkWell(
                                                onTap: () {
                                                  Get.dialog(DialogCardLAppInfo(
                                                      slot: 'A',
                                                      spur: controller.spur));
                                                },
                                                child: DisplayStringParser(
                                                    slot: 'A',
                                                    card: 'large',
                                                    spur: controller.spur),
                                              ))
                                            ]),
                                            Row(children: [
                                              Container(
                                                  color: colorBlue7,
                                                  child: TextNunito(
                                                    ' is ',
                                                    size: 15,
                                                    weight: 7,
                                                    color: colorGrey1,
                                                  )),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: TextNunito(
                                                  // Return 'pre' String from map
                                                  getOperatorString(
                                                      controller
                                                          .spur.abOperator,
                                                      'large')['pre'],
                                                  size: 14,
                                                  color: colorYellow2,
                                                  letterspacing: 0.56,
                                                  weight: 3,
                                                ),
                                              )
                                            ]),
                                            Row(children: [
                                              Container(
                                                  color: colorBlue7,
                                                  child: TextNunito(
                                                    // return 'post' string from map
                                                    getOperatorString(
                                                        controller
                                                            .spur.abOperator,
                                                        'large')['post'],
                                                    size: 15,
                                                    weight: 7,
                                                    color: colorGrey1,
                                                  )),
                                              SizedBox(width: 10),
                                              Flexible(
                                                  child: InkWell(
                                                //Only make slot B clickable for info when it is not a manual type
                                                onTap: (spur
                                                            .metricConnectSlotB
                                                            .appService
                                                            .category !=
                                                        'manual')
                                                    ? () {
                                                        Get.dialog(
                                                            DialogCardLAppInfo(
                                                                slot: 'A',
                                                                spur: controller
                                                                    .spur));
                                                      }
                                                    : null,
                                                child: DisplayStringParser(
                                                    slot: 'B',
                                                    card: 'large',
                                                    spur: controller.spur),
                                              ))
                                            ]),
                                            Row(children: [
                                              Container(
                                                  color: colorBlue7,
                                                  child: TextNunito(
                                                    ' on ',
                                                    size: 15,
                                                    weight: 7,
                                                    color: colorGrey1,
                                                  )),
                                              SizedBox(width: 10),
                                              Expanded(
                                                  child: TextNunito(
                                                // controller.spur.dateResolve.,
                                                // '${controller.spur.dateResolve.day.toString().padLeft(2, '0')}-${controller.spur.dateResolve.month.toString().padLeft(2, '0')}-${controller.spur.dateResolve.year.toString()} - ${controller.spur.dateResolve.hour.toString().padLeft(2, '0')}:${controller.spur.dateResolve.minute.toString().padLeft(2, '0')}',
                                                // '11-12-2021 - 21:30',
                                                getFullDateStringLocale(
                                                    controller
                                                        .spur.dateResolve),
                                                size: 13,
                                                color: colorGrey2,
                                                letterspacing: 0.56,
                                                weight: 2,
                                                fontStyle: FontStyle.italic,
                                              )),
                                              TextNunito(
                                                controller.timeLeftString,
                                                size: 12,
                                                color: colorGrey2,
                                                letterspacing: 0.56,
                                                weight: 2,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ]),
                                          ],
                                        ),
                                      )),

                                  /// Money Route box (light blue)
                                  Container(
                                    height: 72,
                                    decoration: BoxDecoration(
                                      // usage of gradient to get the left side dark blue
                                      gradient: LinearGradient(
                                          colors: [colorBlue5, colorBlue1],
                                          stops: [0.063, 0.063]),
                                      color: colorBlue1,

                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MoneyRouteRow(
                                            textResolveType: 'true',
                                            colorArrowBox: colorGreen2,
                                            controller: controller,
                                            weight: 8,
                                          ),
                                          MoneyRouteRow(
                                            textResolveType: 'false',
                                            colorArrowBox: colorRed2,
                                            controller: controller,
                                            weight: 8,
                                          ),
                                          MoneyRouteRow(
                                            textResolveType: 'error',
                                            colorArrowBox: colorYellow2,
                                            controller: controller,
                                            weight: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Circle avatar App Service
                            Positioned(
                              top: -32,
                              left: 0,
                              right: 0,
                              child: CircleAvatar(
                                  maxRadius: 21,
                                  backgroundColor: Colors.green,
                                  child: AppServiceAvatar(
                                    controller: controller,
                                  )),
                            ),

                            /// Line tree in app connect and money route box
                            Positioned(
                              bottom: 176,
                              left: 8,
                              child: CustomPaint(
                                  painter:
                                      LineTreeShape(controller: controller),
                                  child: null),
                            ),
                          ],
                        ),

                        /// Description / owner text box
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14, top: 6, right: 6, bottom: 6),
                          child: Container(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: 315,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextNunito(
                                          'by ${controller.spur.creatorName}',
                                          size: 13,
                                          color: colorGrey8,
                                          letterspacing: 0.56,
                                        ),
                                        Divider(
                                            height: 3,
                                            thickness: 1,
                                            endIndent: 80),
                                        Container(
                                          constraints:
                                              BoxConstraints(minHeight: 30),
                                          child: TextNunito(
                                              controller
                                                  .spur.creatorDescription,
                                              size: 10,
                                              color: colorGrey8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                /// Share icon bottom right
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        'images/share_button_card_l.png',
                                        width: 32,
                                        height: 32,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// PledgeBox
                        if (controller.pledgeBoxOpen)
                          PlayAnimation(
                              tween: Tween<double>(begin: 0.7, end: 1),
                              duration: Duration(milliseconds: 200),
                              builder: (context, child, value) {
                                return Transform(
                                  alignment: Alignment.topCenter,
                                  transform:
                                      Matrix4.diagonal3Values(1, value, 1),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .pledgesMap[
                                                  controller.pledgeOffset]
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            Pledge pledge = controller
                                                    .pledgesMap[
                                                controller.pledgeOffset][index];
                                            Duration(milliseconds: 60);
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6,
                                                  left: 6,
                                                  right: 6,
                                                  bottom: 4),
                                              child: Container(
                                                color: colorBlue1,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: colorBlue4),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10,
                                                                right: 10),
                                                        child: Stack(
                                                          children: [
                                                            Center(
                                                              child: TextNunito(
                                                                  (pledge.name ==
                                                                          'null')
                                                                      ? 'Anomynous'
                                                                      : pledge
                                                                          .name,
                                                                  size: 11,
                                                                  color:
                                                                      colorGrey9,
                                                                  weight: 8),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                TextNunito(
                                                                    getPledgeDateString(
                                                                        pledge
                                                                            .pledgeDate),
                                                                    size: 10,
                                                                    color:
                                                                        colorGrey1),
                                                                TextNunito(
                                                                  '\$ ${pledge.amountRound}',
                                                                  size: 12,
                                                                  color:
                                                                      colorGrey1,
                                                                  weight: 8,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (pledge.message != null)
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: TextNunito(
                                                          pledge.message,
                                                          size: 10,
                                                          color: colorGrey8,
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),

                                        // IF more then 10 pleges we show the pagination
                                        if (controller.totalPledgeCount > 10)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Container(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // GOTO PREVIOUS PAGE
                                                      controller.getPledges(
                                                          offset: controller
                                                                  .pledgeOffset -
                                                              10);
                                                    },
                                                    child: Container(
                                                        width: 60,
                                                        height: 25,
                                                        child: TextNunito(
                                                            'previous',
                                                            color: colorBlue7,
                                                            weight: 8)),
                                                  ),
                                                  // TextNunito('offset'),
                                                  InkWell(
                                                    onTap: () {
                                                      // GOTO NEXT PAGE
                                                      controller.getPledges(
                                                          offset: controller
                                                                  .pledgeOffset +
                                                              10);
                                                    },
                                                    child: Container(
                                                        width: 60,
                                                        height: 25,
                                                        child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: TextNunito(
                                                                'next',
                                                                color:
                                                                    colorBlue7,
                                                                weight: 8))),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                );
                              })
                      ],
                    ),
                  ),
                ),

                // outside column, on top of everything
                /// Balance Box
                Positioned(
                  top: 50,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.dialog(DialogAddPledge());
                    },
                    child: Container(
                        height: 33,
                        // constraints: BoxConstraints(minWidth: 90),
                        decoration: BoxDecoration(
                            color: colorGreen2,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(4),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: colorGrey8.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(-4, 3))
                            ]),
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                CustomIcon.plus,
                                color: colorGrey8,
                                size: 12,
                              ),
                            ),
                            Column(
                              children: [
                                TextNunito('balance',
                                    weight: 6, size: 10, letterspacing: 0.44),
                                Container(
                                  width: 52,
                                  child: Divider(
                                    color: Color(0xFFAAC3BB),
                                    height: 1,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: TextNunito(
                                      '\$ ${controller.spur.balanceRound}',
                                      weight: 8,
                                      size: 13,
                                      color: colorGrey9,
                                      letterspacing: 0.56),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),

                /// Show pledges button
                Positioned(
                  bottom: 0,
                  // left: 0,
                  // right: 0,
                  child: InkWell(
                    onTap: () {
                      // if pledge count == 0 button for add pledge, otherwise open pledge box
                      (controller.totalPledgeCount == 0)
                          ? Get.dialog(DialogAddPledge())
                          : controller.togglePledgeBox();
                    },
                    child: Container(
                      // width: 102,
                      height: 17,
                      decoration: BoxDecoration(
                          color: colorGrey6,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(4))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: TextNunito(
                          controller.pledgeBoxOpen
                              ? 'Close Pledges'
                              : controller.totalPledgeCount > 0
                                  ? 'Show ${controller.totalPledgeCount} Pledges'
                                  : 'Be the first pledger!',
                          size: 12,
                          color: colorGrey9,
                          weight: 4,
                          letterspacing: -0.56,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}

// Widget to display ture false error money route rows
class MoneyRouteRow extends StatelessWidget {
  final String textResolveType;
  final Color colorArrowBox;
  final SpurCardLargeController controller;
  double weight;

  MoneyRouteRow(
      {Key key,
      this.textResolveType,
      this.colorArrowBox,
      this.controller,
      this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String string = '';
    String stringLong = '';
    Color arrowTextColor = colorBlue7;
    Color stringColor = colorGrey9;
    Decoration decoration;
    MoneyRoute moneyRoute;

    /// True route box
    if (textResolveType == 'true') {
      moneyRoute = controller.spur.trueMoneyRoute;
      string = stringMoneyRoute(moneyRoute, true);
      stringLong = stringMoneyRoute(moneyRoute, false);
      if (controller.spur.resolved == true) {
        arrowTextColor =
            (controller.spur.resolveError == true) ? colorBlue5 : colorBlue7;
        decoration = BoxDecoration(
            // usage of gradient to get left side under arrow not colored
            gradient: LinearGradient(
                colors: [colorBlue5, colorGreen1], stops: [0.063, 0.063]));
      } else if (controller.spur.resolved == false) {
        arrowTextColor = colorBlue5;
        stringColor = colorGrey7;
      }

      /// False route box
    } else if (textResolveType == 'false') {
      moneyRoute = controller.spur.falseMoneyRoute;
      string = stringMoneyRoute(moneyRoute, true);
      stringLong = stringMoneyRoute(moneyRoute, false);
      // print(string.length);
      if (controller.spur.resolved == false) {
        arrowTextColor =
            (controller.spur.resolveError == true) ? colorBlue5 : colorBlue7;
        decoration = BoxDecoration(
            // usage of gradient to get left side under arrow not colored
            gradient: LinearGradient(
                colors: [colorBlue5, colorRed1], stops: [0.063, 0.063]));
      } else if (controller.spur.resolved == true) {
        arrowTextColor = colorBlue5;
        stringColor = colorGrey7;
      }

      /// Error route box
    } else if (textResolveType == 'error') {
      stringColor = colorGrey8;
      string = (controller.spur.errorMoneyRoute == true)
          ? 'redirect to true'
          : 'redirect to false';
      if (controller.spur.resolveError == true) {
        weight = 8;
        decoration = BoxDecoration(
            // usage of gradient to get left side under arrow not colored
            gradient: LinearGradient(
                colors: [colorBlue5, colorYellow1], stops: [0.063, 0.063]));
        stringColor = colorGrey9;
      } else if (controller.spur.resolveError != true &&
          controller.spur.resolved != null) {
        arrowTextColor = colorBlue5;
        stringColor = colorGrey7;
      }
    }

    return Container(
      decoration: decoration,
      child: Row(
        children: [
          Container(
            height: 24,
            width: 63,
            child: CustomPaint(
              painter: MoneyRouteShape(bg: colorArrowBox),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, top: 2),
                child: TextNunito(
                  textResolveType,
                  size: 13,
                  weight: weight,
                  color: arrowTextColor,
                  letterspacing: -0.56,
                ),
              ),
            ),
          ),
          Expanded(
            //  Always make moneyroute row clickable for true and false for more info dialog box
            child: (textResolveType == 'true' || textResolveType == 'false')
                ? InkWell(
                    onTap: () {
                      Get.dialog(
                          MoneyRouteDetailsDialog(moneyRoute: moneyRoute));
                    },
                    child: Container(
                      child: TextNunito(string, size: 12, color: stringColor),
                    ),
                  )
                : Container(
                    child: TextNunito(string, size: 12, color: stringColor),
                  ),
          ),
        ],
      ),
    );
  }
}

// shape for money route arrow box
class MoneyRouteShape extends CustomPainter {
  Color bg;
  MoneyRouteShape({this.bg});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = bg;

    // create a path for box 45 x 14
    var path = Path();
    path.lineTo(52, 0);
    path.lineTo(59, 12);
    path.lineTo(52, 24);
    path.lineTo(0, 24);
    path.lineTo(7, 12);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LineTreeShape extends CustomPainter {
  Color color = colorBlue7;
  // Color for part of tree that is inactive
  Color colorPassive = colorBlue5;
  SpurCardLargeController controller;
  LineTreeShape({this.controller});
  @override
  void paint(Canvas canvas, Size size) {
    /// TOP main line
    final paintTop = Paint();
    paintTop.color = color;
    paintTop.style = PaintingStyle.stroke;
    paintTop.strokeWidth = 1.0;
    var pathTop = Path();
    pathTop.lineTo(0, 0);
    pathTop.lineTo(0, 116);

    canvas.drawPath(pathTop, paintTop);

    /// True line
    final paintTrue = Paint();
    paintTrue.color = color;
    paintTrue.style = PaintingStyle.stroke;
    paintTrue.strokeWidth = 1.0;
    var pathTrue = Path();
    pathTrue.moveTo(0, 116);
    pathTrue.lineTo(8, 116);

    // canvas.drawPath(pathTrue, paintTrue);

    /// False line
    final paintFalse = Paint();
    paintFalse.color = color;
    paintFalse.style = PaintingStyle.stroke;
    paintFalse.strokeWidth = 1.0;
    var pathFalse = Path();
    pathFalse.moveTo(0, 116);
    pathFalse.lineTo(0, 140);
    pathFalse.lineTo(8, 140);

    // canvas.drawPath(pathFalse, paintFalse);

    /// ERROR line
    final paintError = Paint();
    paintError.color = color;
    paintError.style = PaintingStyle.stroke;
    paintError.strokeWidth = 1.0;
    var pathError = Path();
    pathError.moveTo(0, 116);
    pathError.lineTo(0, 164);
    pathError.lineTo(8, 164);

    // canvas.drawPath(pathError, paintError);

    /// Logic
    if (controller.spur.resolved == true &&
        controller.spur.resolveError != true) {
      paintFalse.color = colorPassive;
      paintError.color = colorPassive;
      canvas.drawPath(pathFalse, paintFalse);
      canvas.drawPath(pathError, paintError);

      canvas.drawPath(pathTrue, paintTrue);
    } else if (controller.spur.resolved == false &&
        controller.spur.resolveError != true) {
      paintTrue.color = colorPassive;
      paintError.color = colorPassive;
      canvas.drawPath(pathTrue, paintTrue);
      canvas.drawPath(pathError, paintError);

      canvas.drawPath(pathFalse, paintFalse);
    } else if (controller.spur.resolveError == true) {
      paintTrue.color = colorPassive;
      paintFalse.color = colorPassive;
      canvas.drawPath(pathTrue, paintTrue);
      canvas.drawPath(pathFalse, paintFalse);

      canvas.drawPath(pathError, paintError);
    } else {
      canvas.drawPath(pathTrue, paintTrue);
      canvas.drawPath(pathFalse, paintFalse);
      canvas.drawPath(pathError, paintError);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
