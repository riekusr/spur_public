import 'package:aqueduct/aqueduct.dart';

import 'model/spur_model.dart';

void test() async {
  Spur first;

  first.title = 'Dit is de eerste titel kutjes';
  first.balance = 40000;
  first.dateResolve = DateTime.now().toUtc();
  first.dateCreation = DateTime.now().toUtc();
  first.type = 'basic';

  final authorQuery = Query<Author>(context)..values.name = "Fred";
  final author = await authorQuery.insert();
}
