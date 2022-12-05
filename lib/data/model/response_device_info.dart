// To parse this JSON data, do
//
//     final responseDeviceInfo = responseDeviceInfoFromJson(jsonString);

import 'dart:convert';

ResponseDeviceInfo responseDeviceInfoFromJson(String str) => ResponseDeviceInfo.fromJson(json.decode(str));

String responseDeviceInfoToJson(ResponseDeviceInfo data) => json.encode(data.toJson());

class ResponseDeviceInfo {
  ResponseDeviceInfo({
    this.success,
    this.value,
  });

  bool? success;
  Value? value;

  factory ResponseDeviceInfo.fromJson(Map<String, dynamic> json) => ResponseDeviceInfo(
    success: json["success"],
    value: Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "value": value?.toJson(),
  };
}

class Value {
  Value({
    this.id,
    this.label,
    this.ip,
    this.port,
    this.groups = const [],
    this.deviceCode,
    this.deviceStatus,
    this.deviceModel,
    this.deviceOsVersion,
    this.deviceAppVersion,
    this.deviceLanguage,
    this.joinedTime,
    this.organizationCode,
    this.organizationName,
  });

  int? id;
  String? label;
  String? ip;
  int? port;
  List<String> groups;
  String? deviceCode;
  String? deviceStatus;
  String? deviceModel;
  String? deviceOsVersion;
  String? deviceAppVersion;
  String? deviceLanguage;
  DateTime? joinedTime;
  String? organizationCode;
  String? organizationName;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    label: json["label"],
    ip: json["ip"],
    port: json["port"],
    groups: List<String>.from(json["groups"].map((x) => x)),
    deviceCode: json["device_code"],
    deviceStatus: json["device_status"],
    deviceModel: json["device_model"],
    deviceOsVersion: json["device_os_version"],
    deviceAppVersion: json["device_app_version"],
    deviceLanguage: json["device_language"],
    joinedTime: DateTime.parse(json["joined_time"]),
    organizationCode: json["organization_code"],
    organizationName: json["organization_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "ip": ip,
    "port": port,
    "groups": List<dynamic>.from(groups.map((x) => x)),
    "device_code": deviceCode,
    "device_status": deviceStatus,
    "device_model": deviceModel,
    "device_os_version": deviceOsVersion,
    "device_app_version": deviceAppVersion,
    "device_language": deviceLanguage,
    "joined_time": joinedTime?.toIso8601String(),
    "organization_code": organizationCode,
    "organization_name": organizationName,
  };
}
