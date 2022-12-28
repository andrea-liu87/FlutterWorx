

import 'package:worx/data/model/fields/field_model.dart';

class RadioButton extends Field{

  RadioButton({
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
            type: FieldType.radio_group,
            required: required);

  String? id;
  String? label;
  String? description;
  FieldType? type;
  bool? required;
  List<Option> options;

  factory RadioButton.fromJson(Map<String, dynamic> json) => RadioButton(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    type: typeValue.map[json["type"]],
    required: json["required"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class Option {
  Option({this.label = ""});
  String label;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    label: json["label"]
  );

  Map<String, dynamic> toJson() => {
    "label":label,
  };
}