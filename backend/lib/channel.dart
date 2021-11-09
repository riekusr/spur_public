import 'package:backend/backend.dart';
import 'package:backend/controller/spur_featured_controller.dart';
import 'controller/pledge_controller.dart';
import 'controller/spur_controller.dart';

// This type initializes an application.
//
// Override methods in this class to set up routes and initialize services like
// database connections. See http://aqueduct.io/docs/http/channel/.
class BackendChannel extends ApplicationChannel {
  ManagedContext context;

  // Initialize services in this method.
  //
  // Implement this method to initialize services, read values from [options]
  // and any other initialization required before constructing [entryPoint].
  //
  // This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "admin", "CENSORED", "localhost", 5432, "spur");

    context = ManagedContext(dataModel, persistentStore);
  }

  // Construct the request channel.
  //
  // Return an instance of some [Controller] that will be the initial receiver
  // of all [Request]s.
  //
  // This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // router for spurs
    router.route('/spur/[:id]').link(() => SpurController(context));
    // router for featured spurs
    router.route('/spur/featured').link(() => SpurFeaturedController(context));
    // router for pledges
    router.route('/pledge').link(() => PledgeController(context));

    // return images
    router
        .route('/spurimages/*')
        .link(() => FileController('public/spurimages/'));
    router
        .route('/appavatars/*')
        .link(() => FileController('public/appavatars/'));

    // EXAMPLE
    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/example").linkFunction((request) async {
      return Response.ok('je geteste blabla');
      // return Response.ok({"key": "value"});
    });

    return router;
  }
}
