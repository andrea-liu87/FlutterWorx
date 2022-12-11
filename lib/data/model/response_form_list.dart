import 'dart:convert';

import 'package:worx/data/model/empty_form.dart';

ResponseFormList responseFormListFromJson(String str) => ResponseFormList.fromJson(json.decode(str));

String responseFormListToJson(ResponseFormList data) => json.encode(data.toJson());

class ResponseFormList {
  ResponseFormList({
    required this.success,
    required this.list,
  });

  bool success;
  List<EmptyForm> list;
  String? error;

  factory ResponseFormList.fromJson(Map<String, dynamic> json) => ResponseFormList(
    success: json["success"],
    list: List<EmptyForm>.from(json["list"].map((x) => EmptyForm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };

  static ResponseFormList withErrorCode(String errorCode) {
    final ResponseFormList response = ResponseFormList(success: false, list: []);
    response.error = errorCode;
    return response;
  }
}