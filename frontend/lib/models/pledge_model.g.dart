// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pledge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pledge _$PledgeFromJson(Map<String, dynamic> json) {
  return Pledge(
    id: json['id'] as int,
    active: json['active'] as bool,
    amount: json['amount'] as int,
    pledgeDate: json['pledgeDate'] == null
        ? null
        : DateTime.parse(json['pledgeDate'] as String),
    name: json['name'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$PledgeToJson(Pledge instance) => <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'amount': instance.amount,
      'pledgeDate': instance.pledgeDate?.toIso8601String(),
      'name': instance.name,
      'message': instance.message,
    };
