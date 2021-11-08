import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration9 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("money_route", SchemaColumn("charityWebsite", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.addColumn("money_route", SchemaColumn("charityCategory", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.addColumn("money_route", SchemaColumn("charityMission", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    