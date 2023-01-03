import 'package:worx/data/model/value/value.dart';

import '../fields/field_model.dart';

class DropDownValue extends Value{

  DropDownValue({
    this.valueIndex
  }): super(type: FieldType.dropdown);

  int? valueIndex;

  factory DropDownValue.fromJson(Map<String, dynamic> json) => DropDownValue(
    valueIndex: json["value_index"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "value_index": valueIndex
  };
}