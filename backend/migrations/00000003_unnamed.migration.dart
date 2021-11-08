import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration3 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("spur_money_route", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("spur_money_route", SchemaColumn.relationship("spur", ManagedPropertyType.bigInteger, relatedTableName: "spur", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("spur_money_route", SchemaColumn.relationship("moneyRoute", ManagedPropertyType.bigInteger, relatedTableName: "money_route", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("money_route", SchemaColumn("type", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false));
		database.deleteColumn("money_route", "varA");
		database.deleteColumn("money_route", "varB");
		database.deleteColumn("money_route", "spur");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    