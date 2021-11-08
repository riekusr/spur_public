import 'package:aqueduct/aqueduct.dart';

import 'money_route_model.dart';

class Spur extends ManagedObject<_Spur> implements _Spur {}

@Table(name: "spur")
class _Spur {
  @primaryKey
  int id;
  String title;

  // Balance in cents, $10  1000
  @Column(defaultValue: '0')
  int balance;

  DateTime dateResolve;
  DateTime dateCreation;
  String type;

  @Column(nullable: true, defaultValue: null)
  bool resolved;

  @Column(nullable: true, defaultValue: null)
  bool resolveError;

  @Column(nullable: true, defaultValue: null)
  bool errorRoute;

  ManagedSet<MoneyRoute> moneyRoutes;
}
