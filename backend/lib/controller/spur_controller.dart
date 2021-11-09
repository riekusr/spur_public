import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/spur_model.dart';
// import 'package:heroes/heroes.dart';

class SpurController extends ResourceController {
  SpurController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllSpurs() async {
    final spurQuery = Query<Spur>(context);
    final spurs = await spurQuery.fetch();
    // print(spurs);
    return Response.ok(spurs);
  }

  @Operation.get('id')
  Future<Response> getSpurByID(@Bind.path('id') int id) async {

    final spurQuery = Query<Spur>(context)
      ..where((s) => s.id).equalTo(id)
      ..join(set: (s) => s.moneyRoutes).join(object: (m) => m.moneyRoute)
      ..join(set: (s) => s.metricConnects)
          .join(object: (m) => m.metricConnect)
          .join(object: (a) => a.appService);

    final spur = await spurQuery.fetchOne();
    // Serialize
    prepMoneyRoute(spur);
    prepMetricConnect(spur);
    // print(spur);
    if (spur == null) {
      return Response.notFound();
    }
    return Response.ok(spur);
  }

}

Spur prepMetricConnect(Spur spur) {
  // iterate over both metriConneccts
  spur.metricConnects.forEach((element) {
    // Cast the MetricConnect object to map
    final elementMap = element.asMap();
    //Clean the SpurMetricConnect part
    final bodySpurMetricConnect = {...elementMap}
      ..remove('metricConnect')
      ..remove('spur')
      ..remove('id');
    // clean theMetricConnect part
    final bodyMetricConnect = {...elementMap}['metricConnect'];
    // combine 2 Maps into one
    final completeMetricConnect = {
      ...bodySpurMetricConnect,
      ...bodyMetricConnect
    };
    // tie right map to the right slot
    if (element.forSlot == 'A') {
      spur.metricConnectSlotA = completeMetricConnect;
    } else if (element.forSlot == 'B') {
      spur.metricConnectSlotB = completeMetricConnect;
    }
  });
  // remove the old list map
  spur.removePropertyFromBackingMap('metricConnects');
  return spur;
}

Spur prepMoneyRoute(Spur spur) {
  // iterate over both routes
  spur.moneyRoutes.forEach((element) {
    // Cast the SpurMoneyRoute object to map
    final elementMap = element.asMap();
    //Clean the SpurMoneyRoute part
    final bodySpurMoneyRoute = {...elementMap};
    bodySpurMoneyRoute.remove('moneyRoute');
    bodySpurMoneyRoute.remove('spur');
    bodySpurMoneyRoute.remove('id');
    // bodySpurMoneyRoute.remove('forResolve');
    // clean MoneyRoute part
    final bodyMoneyRoute = {...elementMap}['moneyRoute'];
    bodyMoneyRoute.remove('id');
    // Merge the 2 bodies into 1 parent map
    final completeMoneyRoute = {...bodySpurMoneyRoute, ...bodyMoneyRoute};
    // return the true or false route
    if (element.forResolve == true) {
      spur.trueMoneyRoute = completeMoneyRoute;
    } else if (element.forResolve == false) {
      spur.falseMoneyRoute = completeMoneyRoute;
    }
  });
  // remove old moneyroute data
  spur.removePropertyFromBackingMap('moneyRoutes');
  return spur;
}
