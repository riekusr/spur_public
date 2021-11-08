import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/metric_connect_model.dart';
import 'package:backend/model/spur_model.dart';

import 'money_route_model.dart';

/// JOIN TABLE spur and metricconnect, every spur has 2 metricConnects, slot A and Slot B
class SpurMetricConnect extends ManagedObject<_SpurMetricConnect>
    implements _SpurMetricConnect {}

@Table(name: "spur__metric_connect")
class _SpurMetricConnect {
  @primaryKey
  int id;
  // FK to spur
  @Relate(#metricConnects)
  Spur spur;
  // FK to metric connect
  @Relate(#metricConnects)
  MetricConnect metricConnect;

  // Defines if this mettric connect is for slot A or B
  @Column(nullable: false)
  String forSlot; // A or B

  @Column(nullable: true)
  String varA;

  @Column(nullable: true)
  String varB;

  @Column(nullable: true)
  String outCome;

  @Column(nullable: true)
  DateTime outcomeDate;

  // @Column(nullable: true)
  // blob outcomeDump;

}
