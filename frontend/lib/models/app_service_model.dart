import 'package:json_annotation/json_annotation.dart';

part 'app_service_model.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class AppService {
  int id;
  String name;
  String shortName;
  String avatarImage;
  String category;
  String websiteUrl;
  String description;

  AppService({
    this.id,
    this.name,
    this.shortName,
    this.avatarImage,
    this.category,
    this.websiteUrl,
    this.description,
  });

  // For Json serializable build runner
  factory AppService.fromJson(Map<String, dynamic> data) =>
      _$AppServiceFromJson(data);
  Map<String, dynamic> toJson() => _$AppServiceToJson(this);
}
