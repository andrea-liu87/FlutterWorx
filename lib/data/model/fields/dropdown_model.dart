import 'package:worx/data/model/fields/field_model.dart';
import 'package:worx/data/model/fields/radio_button_model.dart';

class DropDown extends Field{

  DropDown({
    this.id,
    this.label,
    this.description,
    this.type,
    this.required,
    this.options = const <Option>[],
  }) : super(
      id: id,
      label: label,
      description: description,
      type: FieldType.dropdown,
      required: required);

  String? id;
  String? label;
  String? description;
  FieldType? type;
  bool? required;
  List<Option> options;

  factory DropDown.fromJson(Map<String, dynamic> json) => DropDown(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    type: typeValue.map[json["type"]],
    required: json["required"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "label":label,
    "description": description,
    "type": typeValue.reverse[type],
    "required": required,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}