import 'package:worx/data/model/value/value.dart';

import '../fields/field_model.dart';

class CheckBoxValue extends Value {
  CheckBoxValue({
    this.values = const<bool>[],
  }): super(type: FieldType.checkbox_group);

  List<bool> values;

  factory CheckBoxValue.fromJson(Map<String, dynamic> json) => CheckBoxValue(
    values: List<bool>.from(json["values"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "values": List<dynamic>.from(values.map((x) => x)),
  };
}