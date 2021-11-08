import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/spur_model.dart';

class Pledge extends ManagedObject<_Pledge> implements _Pledge {}

@Table(name: "pledge")
class _Pledge {
  @primaryKey
  int id;

  // FK
  @Relate(#pledges)
  Spur spur;

  // wheter to show pledge or not
  @Column(nullable: false)
  bool active;

  // Balance in cents, $10  1000
  @Column(nullable: false)
  int amount;

  @Column(nullable: false)
  DateTime pledgeDate;

  // pledge owner name, null = anomynous
  @Column(nullable: true)
  String name;

  @Column(nullable: true)
  String message;

  @Column(nullable: false)
  String email;
}
