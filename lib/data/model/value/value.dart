
import '../fields/field_model.dart';

class Value {
  Value({
    this.type
  });

  FieldType? type;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    type: typeValue.map[json["type"]]
  );

  Map<String, dynamic> toJson() => {
    "type": typeValue.reverse[type],
  };
}