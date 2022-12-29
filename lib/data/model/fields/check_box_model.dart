import 'package:worx/data/model/fields/field_model.dart';
import 'package:worx/data/model/fields/radio_button_model.dart';

class CheckBox extends Field{

  CheckBox({
    this.id,
    this.label,
    this.description,
    this.type,
    this.required,
    this.options = const <Option>[],
    this.minCheck = 0,
    this.maxCheck = 0
  }) : super(
      id: id,
      label: label,
      description: description,
      type: FieldType.radio_group,
      required: required);

  String? id;
  String? label;
  String? description;
  FieldType? type;
  bool? required;
  List<Option> options;
  int minCheck;
  int maxCheck;

  factory CheckBox.fromJson(Map<String, dynamic> json) => CheckBox(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    type: typeValue.map[json["type"]],
    required: json["required"],
    options: List<Option>.from(json["group"].map((x) => Option.fromJson(x))),
    minCheck: json["min_checked"],
    maxCheck: json["max_checked"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label":label,
    "description": description,
    "type": typeValue.reverse[type],
    "required": required,
    "group": List<dynamic>.from(options.map((x) => x.toJson())),
    "min_checked": minCheck,
    "max_checked": maxCheck
  };
}