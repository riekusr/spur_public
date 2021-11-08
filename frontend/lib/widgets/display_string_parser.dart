import 'package:flutter/material.dart';
import 'package:spur/models/metric_connect_model.dart';
import 'package:spur/models/spur_model.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/widgets/text.dart';
// This widget generates the String you see in SLOT A and SLOT B
// it takes the display string, parses the ^# variables out and created
// a container for each word and places them in a row with styling.

class DisplayStringParser extends StatelessWidget {
  final Spur spur;
  final String slot;
  final String card;

  const DisplayStringParser({Key key, this.card, this.spur, this.slot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = displayStringParser(spur, slot);
    return Wrap(
      spacing: 3,
      children: widgetList,
    );
  }
}

/// Function to parse string to widget list
List<Widget> displayStringParser(Spur spur, String slot) {
  List<Widget> widgetList = [];

  // check if for slot A or slot B
  MetricConnect metricConnect =
      (slot == 'A') ? spur.metricConnectSlotA : spur.metricConnectSlotB;
  if (metricConnect != null) {
    // split at spaces
    List<String> split = metricConnect.displayString.split(' ');
    // for each word, look vfor variables, and return a widget
    split.forEach((word) {
      Widget widget;
      if (word == '^#varA') {
        widget = Container(
          decoration: BoxDecoration(
            color: colorBlue8,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 4, left: 4),
            child: TextNunito(
              shortenVariable(metricConnect.varA),
              color: colorGrey1,
              size: 13,
              letterspacing: -0.56,
              weight: 4,
            ),
          ),
        );
      } else if (word == '^#varB') {
        widget = Container(
          decoration: BoxDecoration(
            color: colorBlue8,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 4, left: 4),
            child: TextNunito(
              shortenVariable(metricConnect.varB),
              color: colorGrey1,
              size: 13,
              letterspacing: -0.56,
              weight: 4,
            ),
          ),
        );
      } else if (word == '^#slotADisplayUnit') {
        widget = TextNunito(
          spur.metricConnectSlotA.displayUnit,
          color: colorGrey1,
          size: 14,
          letterspacing: -0.56,
          weight: 3,
        );
      } else {
        widget = TextNunito(
          word,
          color: colorGrey1,
          size: 14,
          letterspacing: -0.56,
          weight: 3,
        );
      }

      widgetList.add(widget);
    });
  } else {
    widgetList.add(Text('none found'));
  }

  return widgetList;
}

String shortenVariable(String string) {
  if (string.length > 35) return string.substring(0, 35) + '...';
  return string;
}
