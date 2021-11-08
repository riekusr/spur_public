import 'package:aqueduct/aqueduct.dart';

class MoneyRouteOptions extends ManagedObject<_MoneyRouteOptions>
    implements _MoneyRouteOptions {}

@Table(name: "money_route")
class _MoneyRouteOptions {
  @primaryKey
  int id;

  bool type;
  String category;
  String name;
  @Column(nullable: true)
  DateTime dateFulfilled;

  @Column(nullable: true)
  DateTime dateCreation;
}
