import 'dart:mirrors';
import 'package:http/http.dart' as http;

void main() {
  print('test');
  MainProcess();
}

class MainProcess {
  bool run = true;
  MainProcess() {
    loop();
  }

  void loop() async {
    while (run) {
      // while loop to check every 30? minutes or so if there are spurs to resolve.
      final resolvingSpurs =
          await Future.delayed(Duration(seconds: 6), () => fetchSpurs());

      // This should be a list with spurs that needs to be rsolved
      print(resolvingSpurs);

      //iterate over the list of to-be-rsolved spurs
      resolvingSpurs.forEach((spur) async {
        //! below would be a seperate function, and in this for-each-loop, we would resolve
        //! both Slot A and Slot B and perform the evaluation and generate result
        var instance;
        // get the classname from spur
        final className = spur['internalName'];
        final varA = spur['varA'];
        // find the class with the class name
        ClassMirror classMirror = currentMirrorSystem()
            .isolate
            .rootLibrary
            .declarations[Symbol(className)];
        // create instance of class and pass varA as positional argument
        if (classMirror != null) {
          MetricConnect instance =
              classMirror.newInstance(Symbol(''), [varA]).reflectee;
        }
        // use instance to get result from metricconnect
        final result = await instance.fetch();
        print('Final rsult: $result');
      });
    }
  }

  List<Map> fetchSpurs() {
    print('fetching spurs from db');
    return [
      {'internalName': 'StravaWeeklyKm', 'varA': 'Riekus'},
      {'internalName': 'StravaTotalKm', 'varA': 'Jemoer'}
    ];
  }
}

/// Raad about polymorphism to structure these inheretance better
/// https://dart.academy/inheritance-polymorphism-and-composition-in-dart-and-flutter/

// skeleton for an App object
abstract class App {
  int appId;
  String appName;
  String apiBaseUrl;
}

// skeleton for an MetricConnect object
abstract class MetricConnect {
  final varA;
  final varB;
  var error;
  bool resolvedIn;
  MetricConnect(this.varA, {this.varB});
  // get data from API with variable
  String fetch() {}
}

//example implementation of App
class Strava implements App {
  int appId;
  String appName = "Strava";
  String apiBaseUrl = 'https://strava.com/api';
  String apiTioken = '';
}

//example implementation of MettricConnect
class StravaWeeklyKm extends Strava implements MetricConnect {
  final varA;
  final varB;
  var error;
  bool resolvedIn;
  StravaWeeklyKm(this.varA, {this.varB});

  @override
  String fetch() {
    print('fetching api with$varA to get the weekly kilometers');
    print(apiBaseUrl);
    return 'result of weekly strava KM';
  }
}

// second implementation of mettricConnect
class StravaTotalKm extends Strava implements MetricConnect {
  final varA;
  final varB;
  var error;
  bool resolvedIn;
  StravaTotalKm(this.varA, {this.varB});

  @override
  String fetch() {
    print('fetching api with $varA to get the total kilometers');
    print(apiBaseUrl);
    return 'result of total strava KM';
  }
}
