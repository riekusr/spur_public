import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration14 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("metric_conenct", SchemaColumn("varAname", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.addColumn("metric_conenct", SchemaColumn("varBname", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.addColumn("metric_conenct", SchemaColumn("varAconstraints", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.addColumn("metric_conenct", SchemaColumn("varBconstraints", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.deleteColumn("metric_conenct", "varConstraints");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    