import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/models/app_service_model.dart';
import 'package:spur/models/metric_connect_model.dart';
import 'package:spur/models/spur_model.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/settings.dart';
import 'package:spur/widgets/app_avatar.dart';
import 'package:spur/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogCardLAppInfo extends StatelessWidget {
  Spur spur;
  String slot;
  MetricConnect metricConnect;
  AppService appService;
  String imageUrl = '';
  DialogCardLAppInfo({this.spur, this.slot}) {
    metricConnect =
        (slot == 'A') ? spur.metricConnectSlotA : spur.metricConnectSlotB;
    appService = metricConnect.appService;
    imageUrl = appAvatarUri.toString() + appService.avatarImage;
    print(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 4.0,
      backgroundColor: colorGrey2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Top dialog
          Container(
            alignment: Alignment.center,
            width: 88,
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: colorBlueMain,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 3)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextNunito('Connection',
                  size: 13, weight: 8, color: colorGrey2),
            ),
          ),

          /// Body Dialog
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Container(
                constraints: BoxConstraints(maxWidth: 300),
                // Main body content
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                            maxRadius: 21,
                            backgroundColor: Colors.green,
                            child: Container(
                                child: Image.network(
                              imageUrl,
                              fit: BoxFit.fitWidth,
                              width: 42,
                              height: 42,
                            ))),
                        TextNunito(appService.name,
                            size: 14, color: colorGrey8),
                        TextNunito(metricConnect.name,
                            size: 15, color: colorBlue7),
                        Divider(
                            height: 3, thickness: 1, indent: 32, endIndent: 32),
                        TextNunito(metricConnect.description,
                            size: 12, color: colorGrey7),
                        SizedBox(height: 9),
                        TextNunito(
                            'Result is a ${metricConnect.outcomeTypeNormalized} in ${metricConnect.displayUnit} ',
                            size: 12,
                            fontStyle: FontStyle.italic,
                            color: colorGrey7),
                        Divider(
                            height: 3, thickness: 1, indent: 32, endIndent: 32),
                        SizedBox(height: 15),
                        TextNunito(metricConnect.varAname,
                            size: 11, color: colorGrey8),
                        TextNunito(metricConnect.varA,
                            size: 15, color: colorBlue7),
                        // if metricconect has a source url to point to profile or detail page
                        if (metricConnect.sourceLinkUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(
                              onTap: () {
                                // interpolation of sourceLinkurl with variable
                                var _url = metricConnect.sourceLinkUrl
                                    .replaceFirst('^#varA', metricConnect.varA);
                                print(_url);
                                launch(_url.toString());
                              },
                              child: TextNunito(
                                'see ${metricConnect.varAname} on ${appService.name}',
                                size: 13,
                                color: colorBlue6,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                      ],
                    ))),
          ),

          /// CLOSE button Dalog
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Get.back();
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: colorBlue7)),
              child:
                  TextNunito('close', size: 13, color: colorBlue7, weight: 7),
            ),
          ),
        ],
      ),
    );
  }
}
