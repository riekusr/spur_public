// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spur_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spur _$SpurFromJson(Map<String, dynamic> json) {
  return Spur(
    id: json['id'] as int,
    title: json['title'] as String,
    balance: json['balance'] as int,
    dateResolve: json['dateResolve'] == null
        ? null
        : DateTime.parse(json['dateResolve'] as String),
    dateCreation: json['dateCreation'] == null
        ? null
        : DateTime.parse(json['dateCreation'] as String),
    resolved: json['resolved'] as bool,
    resolveError: json['resolveError'] as bool,
    errorMoneyRoute: json['errorMoneyRoute'] as bool,
    creatorName: json['creatorName'] as String,
    creatorDescription: json['creatorDescription'] as String,
    abOperator: json['abOperator'] as String,
  )
    ..trueMoneyRoute = json['trueMoneyRoute'] == null
        ? null
        : MoneyRoute.fromJson(json['trueMoneyRoute'] as Map<String, dynamic>)
    ..falseMoneyRoute = json['falseMoneyRoute'] == null
        ? null
        : MoneyRoute.fromJson(json['falseMoneyRoute'] as Map<String, dynamic>)
    ..metricConnectSlotA = json['metricConnectSlotA'] == null
        ? null
        : MetricConnect.fromJson(
            json['metricConnectSlotA'] as Map<String, dynamic>)
    ..metricConnectSlotB = json['metricConnectSlotB'] == null
        ? null
        : MetricConnect.fromJson(
            json['metricConnectSlotB'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SpurToJson(Spur instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'balance': instance.balance,
      'dateResolve': instance.dateResolve?.toIso8601String(),
      'dateCreation': instance.dateCreation?.toIso8601String(),
      'trueMoneyRoute': instance.trueMoneyRoute,
      'falseMoneyRoute': instance.falseMoneyRoute,
      'metricConnectSlotA': instance.metricConnectSlotA,
      'metricConnectSlotB': instance.metricConnectSlotB,
      'resolved': instance.resolved,
      'resolveError': instance.resolveError,
      'errorMoneyRoute': instance.errorMoneyRoute,
      'creatorName': instance.creatorName,
      'creatorDescription': instance.creatorDescription,
      'abOperator': instance.abOperator,
    };
