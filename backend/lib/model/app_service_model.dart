import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/metric_connect_model.dart';

class AppService extends ManagedObject<_AppService> implements _AppService {}

@Table(name: "app_service")
class _AppService {
  @primaryKey
  int id;
  //AppService name
  @Column(nullable: false)
  String name;

  @Column(nullable: false)
  String shortName;

  @Column(nullable: true)
  String avatarImage;

  @Column(nullable: false)
  String category;

  @Column(nullable: true)
  String websiteUrl;

  @Column(nullable: true)
  String description;

  ManagedSet<MetricConnect> metricConnects;
}
