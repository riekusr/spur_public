import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration13 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("app_service", SchemaColumn("avatarImage", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.deleteColumn("app_service", "avatarUrl");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    