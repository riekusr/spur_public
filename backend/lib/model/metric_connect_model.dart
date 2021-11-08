import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/app_service_model.dart';
import 'package:backend/model/spur_model.dart';

class MetricConnect extends ManagedObject<_MetricConnect>
    implements _MetricConnect {}

@Table(name: "metric_conenct")
class _MetricConnect {
  @primaryKey
  int id;

  // FK
  @Relate(#metricConnects)
  AppService appService;

  @Column(nullable: false)
  String name;

  @Column(nullable: false)
  String displayString;

  @Column(nullable: true)
  String displayUnit;
  // String or double
  @Column(nullable: false)
  String outcomeType;

  @Column(nullable: true)
  String description;

  @Column(nullable: false)
  String internalName;

  @Column(nullable: true)
  String varAname;

  @Column(nullable: true)
  String varBname;

  @Column(nullable: true)
  String varAconstraints;

  @Column(nullable: true)
  String varBconstraints;

  @Column(nullable: true)
  String sourceLinkUrl;

  ManagedSet<MetricConnect> metricConnects;
}
