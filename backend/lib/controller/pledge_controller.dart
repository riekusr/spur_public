import 'dart:convert';

import 'package:aqueduct/aqueduct.dart';
import 'package:backend/model/pledge_model.dart';
import 'package:backend/model/spur_model.dart';
// import 'package:heroes/heroes.dart';

class PledgeController extends ResourceController {
  PledgeController(this.context);

  final ManagedContext context;

  // @Operation.get()
  // Future<Response> getAllSpurs() async {
  //   final spurQuery = Query<Spur>(context);
  //   final spurs = await spurQuery.fetch();
  //   // print(spurs);
  //   return Response.ok(spurs);
  // }

  @Operation.get()
  Future<Response> getPledge(
      {@Bind.query('pledgeid') int pledgeId,
      @Bind.query('spurid') int spurId,
      @Bind.query('offset') int offset}) async {
    // print('plege id $pledgeId');

    /// when using only pledgeID
    if (pledgeId != null && spurId == null) {
      return Response.ok(pledgeId);

      /// when using Spur ID, returning a list of pledges
    } else if (spurId != null && pledgeId == null) {
      //query
      final pledgeQuery = Query<Pledge>(context)
        ..where((x) => x.spur.id).equalTo(spurId)
        ..sortBy((x) => x.pledgeDate, QuerySortOrder.descending)
        ..fetchLimit = 10
        ..offset = offset;
      final pledges = await pledgeQuery.fetch();

      // get total pledges for specific spur.
      final pledgeCountQuery = Query<Pledge>(context)
        ..where((x) => x.spur.id).equalTo(spurId);
      final pledgeCount = await pledgeCountQuery.reduce.count();

      // convert list pledges objects to list pledges as map
      final pledgesasMap = pledges.map((e) => e.asMap()).toList();

      // return response with pledges length and list of pledges
      return Response.ok({'count': pledgeCount, 'pledges': pledgesasMap});

      /// when using both or typo
    } else {
      return Response.badRequest(
          body: {"error": "Can not use pledgeid and spur Id same time'"});
    }
  }
}
// final spurQuery = Query<Spur>(context)
//   ..where((s) => s.id).equalTo(id)
//   ..join(set: (s) => s.moneyRoutes).join(object: (m) => m.moneyRoute);
// final spur = await spurQuery.fetchOne();
// print(spur);
// if (spur == null) {
//   return Response.notFound();
// }
// return Response.ok(spur);
