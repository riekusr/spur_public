// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric_connect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricConnect _$MetricConnectFromJson(Map<String, dynamic> json) {
  return MetricConnect(
    forSlot: json['forSlot'] as String,
    varA: json['varA'] as String,
    varB: json['varB'] as String,
    outCome: json['outCome'] as String,
    outcomeDate: json['outcomeDate'] == null
        ? null
        : DateTime.parse(json['outcomeDate'] as String),
    id: json['id'] as int,
    name: json['name'] as String,
    displayString: json['displayString'] as String,
    displayUnit: json['displayUnit'] as String,
    outcomeType: json['outcomeType'] as String,
    description: json['description'] as String,
    internalName: json['internalName'] as String,
    varAname: json['varAname'] as String,
    varBname: json['varBname'] as String,
    varAconstraints: json['varAconstraints'] as String,
    varBconstraints: json['varBconstraints'] as String,
    sourceLinkUrl: json['sourceLinkUrl'] as String,
    appService: json['appService'] == null
        ? null
        : AppService.fromJson(json['appService'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetricConnectToJson(MetricConnect instance) =>
    <String, dynamic>{
      'forSlot': instance.forSlot,
      'varA': instance.varA,
      'varB': instance.varB,
      'outCome': instance.outCome,
      'outcomeDate': instance.outcomeDate?.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'displayString': instance.displayString,
      'displayUnit': instance.displayUnit,
      'outcomeType': instance.outcomeType,
      'description': instance.description,
      'internalName': instance.internalName,
      'varAname': instance.varAname,
      'varBname': instance.varBname,
      'varAconstraints': instance.varAconstraints,
      'varBconstraints': instance.varBconstraints,
      'sourceLinkUrl': instance.sourceLinkUrl,
      'appService': instance.appService,
    };
