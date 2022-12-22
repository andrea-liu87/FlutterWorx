

import 'package:worx/data/model/value/value.dart';

import '../fields/field_model.dart';

class TextValue extends Value{

  TextValue({
    this.value
  }): super(type: FieldType.text);

  String? value;

  factory TextValue.fromJson(Map<String, dynamic> json) => TextValue(
    value: json["values"]
  );

  Map<String, dynamic> toJson() => {
    "values": value
  };
}