import 'package:json_annotation/json_annotation.dart';

part 'spur_money_route_model.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class MoneyRoute {
  String type;
  String name;
  String email;
  String btcAddress;
  bool forResolve;

  String charityWebsite;
  String charityCategory;
  String charityMission;

  MoneyRoute(
      {this.type,
      this.name,
      this.email,
      this.btcAddress,
      this.forResolve,
      this.charityCategory,
      this.charityMission,
      this.charityWebsite});

  // For Json serializable build runner
  factory MoneyRoute.fromJson(Map<String, dynamic> data) =>
      _$MoneyRouteFromJson(data);
  Map<String, dynamic> toJson() => _$MoneyRouteToJson(this);
}
