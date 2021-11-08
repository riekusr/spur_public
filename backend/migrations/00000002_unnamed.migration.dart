import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("spur", SchemaColumn("errorMoneyRoute", ManagedPropertyType.boolean, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.deleteColumn("spur", "errorRoute");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    