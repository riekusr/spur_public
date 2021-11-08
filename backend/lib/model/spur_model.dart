import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/pledge_model.dart';
import 'package:backend/model/spur_metric_connect.dart';

import 'money_route_model.dart';
import 'spur__money_route_model.dart';

// INSERT INTO spur (title, balance, datecreation, dateresolve) VALUES ('Deze lange title is voor het goede doel weet jewel', 89500, '2021-02-01 00:00:00.000', '2021-07-05 00:00:00.000')
class Spur extends ManagedObject<_Spur> implements _Spur {
  @Serialize(input: false, output: true)
  Map trueMoneyRoute;

  @Serialize(input: false, output: true)
  Map falseMoneyRoute;

  @Serialize(input: false, output: true)
  Map metricConnectSlotA;

  @Serialize(input: false, output: true)
  Map metricConnectSlotB;
}

@Table(name: "spur")
class _Spur {
  @primaryKey
  int id;
  String title;

  // Balance in cents, $10  1000
  @Column(defaultValue: '0')
  int balance;

  @Column(nullable: false)
  DateTime dateResolve;

  @Column(nullable: false)
  DateTime dateCreation;

  @Column(nullable: true)
  String type;

  @Column(nullable: true)
  String creatorDescription;

  @Column(nullable: true)
  String creatorName;

  @Column(nullable: true, defaultValue: null)
  bool resolved;

  @Column(nullable: true, defaultValue: null)
  bool resolveError;

  @Column(nullable: true, defaultValue: null)
  bool errorMoneyRoute;

  @Column(nullable: true, defaultValue: null, indexed: true)
  bool featured;

  @Column(nullable: true, defaultValue: null)
  String abOperator;

  ManagedSet<SpurMoneyRoute> moneyRoutes;

  ManagedSet<SpurMetricConnect> metricConnects;

  ManagedSet<Pledge> pledges;
}
