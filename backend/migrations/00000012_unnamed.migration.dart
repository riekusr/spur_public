import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration12 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("metric_conenct", SchemaColumn("varConstraints", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.deleteColumn("metric_conenct", "metricConstraints");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    