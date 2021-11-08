import 'package:flutter/material.dart';
import 'package:spur/utils/colors.dart';
import 'package:spur/widgets/text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      color: colorGrey3,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('images/smallheart.png', width: 11, height: 11),
                SizedBox(width: 3),
                Text('spur',
                    style: TextStyle(
                      fontFamily: 'Clab-Bold',
                      fontSize: 14,
                      letterSpacing: -0.75,
                    )),
              ],
            ),
            TextNunito('help', weight: 7, letterspacing: -0.5),
            TextNunito('feedback', weight: 7, letterspacing: -0.5),
          ],
        ),
      ),
    );
  }
}
