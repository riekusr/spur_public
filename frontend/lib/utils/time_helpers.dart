import 'dart:async';

import 'package:spur/models/spur_model.dart';

class CountDownTimer {
  Spur spur;
  CountDownTimer(this.spur);

  Stream<String> timeLeft() async* {
    String timeLeftString = '';
    // if spur is not resolved, show time left
    // if time left under 24 hours show timer, if negative show Resolving
    // if spur.resolved != null show resolved
    if (spur.resolved == null) {
      final now = DateTime.now().toUtc();
      final difference = spur.dateResolve.difference(now);
      try {
        if (difference.inDays > 60) {
          yield timeLeftString =
              'in ${(difference.inDays / 30).round()} months';
        } else if (difference.inDays <= 60 && difference.inDays > 11) {
          yield timeLeftString = 'in ${(difference.inDays / 7).round()} weeks';
        } else if (difference.inDays <= 11 && difference.inDays > 1) {
          yield timeLeftString = 'in ${(difference.inDays)} days';
        } else if (difference.inDays <= 1) {
          if (difference.inHours > 24) {
            yield timeLeftString = 'in ${(difference.inHours)} hours';
          } else if (difference.inHours <= 24 && difference.inSeconds > 0) {
            int _seconds = difference.inSeconds;
            yield* Stream.periodic(Duration(seconds: 1), (timer) {
              while (_seconds > 0) {
                _seconds--;
                Duration _clock = Duration(seconds: _seconds);
                return timeLeftString =
                    '${(_clock.inHours.remainder(60) % 60).toString().padLeft(2, '0')} : ${(_clock.inMinutes.remainder(60) % 60).toString().padLeft(2, '0')} : ${(_clock.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';
              }
              // after seconds is smaller then 0, resolving
              return timeLeftString = 'Resolving!';
            });
          } else if (difference.inSeconds.isNegative) {
            yield timeLeftString = 'Resolving!';
          }
        }
      } catch (e) {
        print('error $e');
      }
    } else {
      yield timeLeftString = 'Resolved';
    }
  }
}

String getFullDateStringLocale(DateTime date) {
  date = date.toLocal();
  final dateString =
      '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString()} - ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  return dateString;
}

String getPledgeDateString(DateTime date) {
  String string = '';
  date = date.toLocal();
  final difference = DateTime.now().difference(date);
  // print(difference);
  // print(difference.inDays);
  if (difference.inHours <= 24) {
    string = 'Today';
  } else if (difference.inHours > 24 && difference.inDays < 35) {
    string = '${difference.inDays} days ago..';
  } else {
    string = '${(difference.inDays / 7).truncateToDouble()} months ago..';
  }
  // print(string);
  // print(difference);
  return string;
}
