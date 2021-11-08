import 'package:aqueduct/aqueduct.dart';
import 'package:backend_worker/model/spur_model.dart';

class MoneyRoute extends ManagedObject<_MoneyRoute> implements _MoneyRoute {}

@Table(name: "money_route")
class _MoneyRoute {
  @primaryKey
  int id;

  String name;

  @Column(nullable: true)
  String varA;
  @Column(nullable: true)
  String varB;

  @Relate(#moneyRoutes)
  Spur spur;
}
