// To parse this JSON data, do
//
//     final joinTeamModel = joinTeamModelFromJson(jsonString);

import 'dart:convert';

JoinTeamModel joinTeamModelFromJson(String str) => JoinTeamModel.fromJson(json.decode(str));

String joinTeamModelToJson(JoinTeamModel data) => json.encode(data.toJson());

class JoinTeamModel {
  JoinTeamModel({
    this.label,
    this.port,
    this.ip,
    this.organizationCode,
    this.deviceCode,
    this.deviceModel,
    this.deviceOsVersion,
    this.deviceAppVersion,
    this.deviceLanguage,
  });

  String? label;
  int? port;
  String? ip;
  String? organizationCode;
  String? deviceCode;
  String? deviceModel;
  String? deviceOsVersion;
  String? deviceAppVersion;
  String? deviceLanguage;

  factory JoinTeamModel.fromJson(Map<String, dynamic> json) => JoinTeamModel(
    label: json["label"],
    port: json["port"],
    ip: json["ip"],
    organizationCode: json["organization_code"],
    deviceCode: json["device_code"],
    deviceModel: json["device_model"],
    deviceOsVersion: json["device_os_version"],
    deviceAppVersion: json["device_app_version"],
    deviceLanguage: json["device_language"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "port": port,
    "ip": ip,
    "organization_code": organizationCode,
    "device_code": deviceCode,
    "device_model": deviceModel,
    "device_os_version": deviceOsVersion,
    "device_app_version": deviceAppVersion,
    "device_language": deviceLanguage,
  };
}
