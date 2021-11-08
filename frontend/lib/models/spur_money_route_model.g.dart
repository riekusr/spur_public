// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spur_money_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyRoute _$MoneyRouteFromJson(Map<String, dynamic> json) {
  return MoneyRoute(
    type: json['type'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    btcAddress: json['btcAddress'] as String,
    forResolve: json['forResolve'] as bool,
    charityCategory: json['charityCategory'] as String,
    charityMission: json['charityMission'] as String,
    charityWebsite: json['charityWebsite'] as String,
  );
}

Map<String, dynamic> _$MoneyRouteToJson(MoneyRoute instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'email': instance.email,
      'btcAddress': instance.btcAddress,
      'forResolve': instance.forResolve,
      'charityWebsite': instance.charityWebsite,
      'charityCategory': instance.charityCategory,
      'charityMission': instance.charityMission,
    };
