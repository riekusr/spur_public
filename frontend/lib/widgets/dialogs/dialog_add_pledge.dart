import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/settings.dart';
import 'package:spur/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogAddPledge extends StatelessWidget {
  DialogAddPledge();

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
            width: 74,
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
              child:
                  TextNunito('pledge', size: 13, weight: 8, color: colorGrey2),
            ),
          ),

          /// Body Dialog
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              // Main body content
              child: DialogAddPledgeBody(),
            ),
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

class DialogAddPledgeBody extends StatelessWidget {
  DialogAddPledgeBody();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextNunito('funds to', size: 11, color: colorGrey8),
            TextNunito('paypal address', size: 15, color: colorBlue7),
            Divider(
              height: 3,
              thickness: 1,
              indent: 32,
              endIndent: 32,
            ),
            TextNunito(
                'When this spur resolves in , funds will be send to the following PayPal address:',
                size: 12,
                color: colorGrey7),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextNunito('kutjes', size: 14, color: colorGrey7),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  final _url = docUrl;

                  print(_url);
                  launch(_url.toString());
                },
                child: TextNunito(
                  'more info',
                  size: 13,
                  color: colorBlue6,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ));
  }
}
