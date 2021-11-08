import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spur/models/spur_money_route_model.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/utils/settings.dart';
import 'package:spur/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class MoneyRouteDetailsDialog extends StatelessWidget {
  final MoneyRoute moneyRoute;

  MoneyRouteDetailsDialog({@required this.moneyRoute});

  @override
  Widget build(BuildContext context) {
    print(moneyRoute.toString());
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
            width: 46,
            decoration: BoxDecoration(
              color: moneyRoute.forResolve ? colorGreen2 : colorRed2,
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
              child: TextNunito(moneyRoute.forResolve.toString(),
                  size: 13, weight: 8, color: colorBlue7),
            ),
          ),

          /// Body Dialog
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: _getBody(moneyRoute),
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
// function to redirect correct dialog body

Widget _getBody(MoneyRoute moneyRoute) {
  if (moneyRoute.type == 'charity') {
    return DialogMoneyRouteCharity(moneyRoute);
  } else if (moneyRoute.type == 'nocharge') {
    return DialogMoneyRouteNoCharge(moneyRoute);
  } else if (moneyRoute.type == 'btc') {
    return DialogMoneyRouteBTC(moneyRoute);
  } else if (moneyRoute.type == 'paypal') {
    return DialogMoneyRoutePayPal(moneyRoute);
  } else {
    return null;
  }
}

/// Body charity dialog
class DialogMoneyRouteCharity extends StatelessWidget {
  final MoneyRoute moneyRoute;
  DialogMoneyRouteCharity(this.moneyRoute);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextNunito('charity', size: 11, color: colorGrey8),
            TextNunito(moneyRoute.name, size: 15, color: colorBlue7),
            Divider(
              height: 3,
              thickness: 1,
              indent: 32,
              endIndent: 32,
            ),
            TextNunito(moneyRoute.charityMission, size: 10, color: colorGrey7),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  final _url = moneyRoute.charityWebsite;
                  launch(_url.toString());
                },
                child: TextNunito(
                  'website',
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

/// Body noCharge dialog
class DialogMoneyRouteNoCharge extends StatelessWidget {
  final MoneyRoute moneyRoute;
  DialogMoneyRouteNoCharge(this.moneyRoute);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            // TextNunito('charity', size: 11, color: colorGrey8),
            TextNunito('No Charge', size: 15, color: colorBlue7),
            Divider(
              height: 3,
              thickness: 1,
              indent: 32,
              endIndent: 32,
            ),
            TextNunito(
                'When this spur resolves in ${moneyRoute.forResolve.toString()}, no credit cards will be charged. All pledgers keep their pledges',
                size: 12,
                color: colorGrey7),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  final _url = docUrl;
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

/// Body BTC dialog

class DialogMoneyRouteBTC extends StatelessWidget {
  final MoneyRoute moneyRoute;
  DialogMoneyRouteBTC(this.moneyRoute);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextNunito('funds to', size: 11, color: colorGrey8),
            TextNunito('bitcoin address', size: 15, color: colorBlue7),
            Divider(
              height: 3,
              thickness: 1,
              indent: 32,
              endIndent: 32,
            ),
            // TextNunito(
            //     'When this spur resolves in ${moneyRoute.forResolve.toString()}, funds (all pledges) will be send to the following BTC address:',
            //     size: 12,
            //     color: colorGrey7),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextNunito(moneyRoute.btcAddress,
                  size: 14, color: colorGrey7),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  final _url =
                      'https://www.blockchain.com/btc/address/${moneyRoute.btcAddress}';
                  print(_url);
                  launch(_url.toString());
                },
                child: TextNunito(
                  'address on BTC Explorer',
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

/// Body PAYPAL dialog
class DialogMoneyRoutePayPal extends StatelessWidget {
  final MoneyRoute moneyRoute;
  DialogMoneyRoutePayPal(this.moneyRoute);
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
                'When this spur resolves in ${moneyRoute.forResolve.toString()}, funds will be send to the following PayPal address:',
                size: 12,
                color: colorGrey7),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextNunito(moneyRoute.email, size: 14, color: colorGrey7),
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
