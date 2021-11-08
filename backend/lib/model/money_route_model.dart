import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/spur_model.dart';
import 'package:backend/model/spur__money_route_model.dart';

class MoneyRoute extends ManagedObject<_MoneyRoute> implements _MoneyRoute {}

@Table(name: "money_route")
class _MoneyRoute {
  @primaryKey
  int id;

  @Column(nullable: false)
  String name;
  @Column(nullable: false)
  String type;

  @Column(nullable: true)
  String charityWebsite;
  @Column(nullable: true)
  String charityCategory;
  @Column(nullable: true)
  String charityMission;

  ManagedSet<SpurMoneyRoute> moneyRoutes;
}
