import 'package:json_annotation/json_annotation.dart';
import 'package:spur/models/app_service_model.dart';

part 'metric_connect_model.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class MetricConnect {
  String forSlot;
  String varA;
  String varB;
  String outCome;
  DateTime outcomeDate;
  int id;
  String name;
  String displayString;
  String displayUnit;
  String outcomeType;
  String description;
  String internalName;
  String varAname;
  String varBname;
  String varAconstraints;
  String varBconstraints;
  String sourceLinkUrl;
  AppService appService;

  MetricConnect({
    this.forSlot,
    this.varA,
    this.varB,
    this.outCome,
    this.outcomeDate,
    this.id,
    this.name,
    this.displayString,
    this.displayUnit,
    this.outcomeType,
    this.description,
    this.internalName,
    this.varAname,
    this.varBname,
    this.varAconstraints,
    this.varBconstraints,
    this.sourceLinkUrl,
    this.appService,
  });

  // Getter for result type
  String get outcomeTypeNormalized {
    var _outcome = '';
    switch (outcomeType) {
      case 'double':
      case 'integer':
        {
          _outcome = 'number';
        }
        break;
      case 'string':
        {
          _outcome = 'string';
        }
        break;
    }
    return _outcome;
  }

  // For Json serializable build runner
  factory MetricConnect.fromJson(Map<String, dynamic> data) =>
      _$MetricConnectFromJson(data);
  Map<String, dynamic> toJson() => _$MetricConnectToJson(this);
}
