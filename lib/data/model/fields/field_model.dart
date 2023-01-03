

import 'package:worx/data/model/fields/check_box_model.dart';
import 'package:worx/data/model/fields/dropdown_model.dart';
import 'package:worx/data/model/fields/radio_button_model.dart';

enum FieldType {
  text,
  checkbox_group,
  dropdown,
  radio_group,
  date,
  rating,
  file,
  photo,
  signature,
  separator}

final typeValue = EnumValues({
  "text": FieldType.text,
  "checkbox_group": FieldType.checkbox_group,
  "dropdown" : FieldType.dropdown,
  "radio_group": FieldType.radio_group,
  "date": FieldType.date,
  "rating": FieldType.rating,
  "file": FieldType.file,
  "photo": FieldType.photo,
  "signature": FieldType.signature,
  "separator": FieldType.separator
});

class Field {
  Field({
    this.id,
    this.label,
    this.description,
    this.type,
    this.required,
  });

  String? id;
  String? label;
  String? description;
  FieldType? type;
  bool? required;


  factory Field.fromJson(Map<String, dynamic> json) {
    if (typeValue.map[json["type"]] == FieldType.radio_group){
      return RadioButton.fromJson(json);
    }
    if (typeValue.map[json["type"]] == FieldType.checkbox_group){
      return CheckBox.fromJson(json);
    }
    if (typeValue.map[json["type"]] == FieldType.dropdown) {
      return DropDown.fromJson(json);
    }
    return Field(
      id: json["id"],
      label: json["label"],
      description: json["description"],
      type: typeValue.map[json["type"]],
      required: json["required"],
    );
  }

  Map<String, dynamic> toJson() {
    if (type == FieldType.checkbox_group){
      //return CheckBox().toJson();
    }
    return {
      "id": id,
      "label": label,
      "description": description,
      "type": typeValue.reverse[type],
      "required": required,
    };
  }
}

class Group {
  Group({
    this.label,
  });

  String? label;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
