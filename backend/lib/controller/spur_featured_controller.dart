import 'package:aqueduct/aqueduct.dart';
import 'package:backend/controller/spur_controller.dart';
import 'package:backend/model/money_route_model.dart';
import 'package:backend/model/spur__money_route_model.dart';
import 'package:backend/model/spur_model.dart';
// import 'package:heroes/heroes.dart';

class SpurFeaturedController extends ResourceController {
  SpurFeaturedController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getFeaturedSpurs() async {
    final spurQuery = Query<Spur>(context)
      ..where((x) => x.featured).equalTo(true)
      ..join(set: (s) => s.moneyRoutes).join(object: (m) => m.moneyRoute)
      ..join(set: (s) => s.metricConnects)
          .join(object: (m) => m.metricConnect)
          .join(object: (a) => a.appService);

    // return query and take only the first 3 items in the list. if list > 3
    final spurs = await spurQuery.fetch(); //! Turn this on to limit output to 3
    // .then((value) => (value.length > 3) ? value.sublist(0, 3) : value);

    // Serialize spurs
    // spurs.forEach(prepMoneyRoute);
    spurs.forEach((spur) {
      prepMoneyRoute(spur);
      prepMetricConnect(spur);
    });

    return Response.ok(spurs);
  }
}
