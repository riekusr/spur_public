// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppService _$AppServiceFromJson(Map<String, dynamic> json) {
  return AppService(
    id: json['id'] as int,
    name: json['name'] as String,
    shortName: json['shortName'] as String,
    avatarImage: json['avatarImage'] as String,
    category: json['category'] as String,
    websiteUrl: json['websiteUrl'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$AppServiceToJson(AppService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'avatarImage': instance.avatarImage,
      'category': instance.category,
      'websiteUrl': instance.websiteUrl,
      'description': instance.description,
    };
