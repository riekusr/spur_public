import 'dart:mirrors';

void main() {
  final appId = 100;
  final appName = 'Garmin';
  var instance;
  // how to access the class from the appId.
  // final go = Strava();
  ClassMirror classMirror =
      currentMirrorSystem().isolate.rootLibrary.declarations[Symbol(appName)];
  if (classMirror != null) {
    print('notnull');
    instance = classMirror.newInstance(Symbol(''), []).reflectee;
  }

  print(Strava().toString);
  print(instance.foo);
}

// skeleton for an Appconnect object
class AppConnect {
  int id;
  var foo;
}

//Strava implementation of Appconnect
class Strava implements AppConnect {
  int id = 100;
  var foo = 'Variable Strava';
}

//Garmin implementation of Appconnect
class Garmin implements AppConnect {
  int id = 200;
  var foo = 'Variable Garmin';
}
