import 'package:worx/data/model/value/value.dart';

import '../fields/field_model.dart';

class RadioButtonValue extends Value{

  RadioButtonValue({
    this.valueIndex
  }): super(type: FieldType.radio_group);

  int? valueIndex;

  factory RadioButtonValue.fromJson(Map<String, dynamic> json) => RadioButtonValue(
    valueIndex: json["value_index"],
  );

  Map<String, dynamic> toJson() => {
    "value_index": valueIndex
  };
}