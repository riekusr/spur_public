import 'package:json_annotation/json_annotation.dart';

part 'pledge_model.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class Pledge {
  int id;
  bool active;
  int amount;
  DateTime pledgeDate;
  String name;
  String message;

  Pledge({
    this.id,
    this.active,
    this.amount,
    this.pledgeDate,
    this.name,
    this.message,
  });

  // Getter for currency int 100 cents to String 1
  String get amountRound => (amount == 0 || amount.toString().length < 3)
      ? '0'
      : amount.toString().substring(0, amount.toString().length - 2);

  // For Json serializable build runner
  factory Pledge.fromJson(Map<String, dynamic> data) => _$PledgeFromJson(data);
  Map<String, dynamic> toJson() => _$PledgeToJson(this);
}
