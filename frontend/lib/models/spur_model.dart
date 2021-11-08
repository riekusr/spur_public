import 'package:json_annotation/json_annotation.dart';
import 'package:spur/models/metric_connect_model.dart';
import 'package:spur/models/spur_money_route_model.dart';

part 'spur_model.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class Spur {
  int id;
  String title;
  int balance;
  DateTime dateResolve;
  DateTime dateCreation;
  MoneyRoute trueMoneyRoute;
  MoneyRoute falseMoneyRoute;
  MetricConnect metricConnectSlotA;
  MetricConnect metricConnectSlotB;
  bool resolved;
  bool resolveError;
  bool errorMoneyRoute;
  String creatorName;
  String creatorDescription;
  String abOperator;

  Spur({
    this.id,
    this.title,
    this.balance,
    this.dateResolve,
    this.dateCreation,
    this.resolved,
    this.resolveError,
    this.errorMoneyRoute,
    this.creatorName,
    this.creatorDescription,
    this.abOperator,
  });

  // Getter for currency int 100 cents to String 1
  String get balanceRound => (balance == 0 || balance.toString().length < 3)
      ? '0'
      : balance.toString().substring(0, balance.toString().length - 2);

  // For Json serializable build runner
  factory Spur.fromJson(Map<String, dynamic> data) => _$SpurFromJson(data);
  Map<String, dynamic> toJson() => _$SpurToJson(this);
}
