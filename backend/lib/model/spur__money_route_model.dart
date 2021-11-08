import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/spur_model.dart';

import 'money_route_model.dart';

/// JOIN TABLE spur and moneyroutes, every spur has 2 moneyroutes
class SpurMoneyRoute extends ManagedObject<_SpurMoneyRoute>
    implements _SpurMoneyRoute {}

@Table(name: "spur__money_route")
class _SpurMoneyRoute {
  @primaryKey
  int id;

  @Relate(#moneyRoutes)
  Spur spur;

  @Relate(#moneyRoutes)
  MoneyRoute moneyRoute;

  bool forResolve;

  @Column(nullable: true)
  String email;

  @Column(nullable: true)
  String btcAddress;
}
