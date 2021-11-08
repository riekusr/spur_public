import 'package:spur/models/spur_money_route_model.dart';

String stringMoneyRoute(MoneyRoute route, bool shortner) {
  String string = '';

  switch (route.type) {
    case 'nocharge':
      {
        string = 'No-charge';
      }
      break;
    case 'charity':
      {
        string = 'Funds to charity: ${route.name}';
      }
      break;
    case 'paypal':
      string = 'Funds to paypal: ${route.email}';
      {}
      break;
    case 'btc':
      string = 'Funds to btc: ${route.btcAddress}';
      {}
      break;
    default:
    // string = 'je moer';
  }
  if (shortner == false) {
    return string;
  } else if (shortner == true) {
    // print('string length route: ${string.length}');
    if (string.length <= 40) {
      return string;
    } else {
      string = string.substring(0, 37) + '...';
      return string;
    }
  } else {
    return string;
  }
}
