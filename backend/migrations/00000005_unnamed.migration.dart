import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration5 extends Migration { 
  @override
  Future upgrade() async {
   		database.alterColumn("spur_money_route", "email", (c) {c.isNullable = true;});
		database.alterColumn("spur_money_route", "btcAddress", (c) {c.isNullable = true;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    