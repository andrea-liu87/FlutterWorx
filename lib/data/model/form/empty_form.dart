// To parse this JSON data, do
//
//     final emptyForm = emptyFormFromJson(jsonString);

import '../fields/field_model.dart';

class EmptyForm {
  EmptyForm({
    this.id,
    this.label,
    this.description,
    this.fields = const <Field>[],
    this.createdOn,
    this.modifiedOn,
    this.submitInZone,
    this.listDefault,
    this.fieldsSize,
  });

  int? id;
  String? label;
  String? description;
  List<Field> fields;
  String? createdOn;
  String? modifiedOn;
  bool? submitInZone;
  bool? listDefault;
  int? fieldsSize;

  factory EmptyForm.fromJson(Map<String, dynamic> json) => EmptyForm(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
    createdOn: json["created_on"],
    modifiedOn: json["modified_on"],
    submitInZone: json["submit_in_zone"],
    listDefault: json["default"],
    fieldsSize: json["fields_size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "description": description,
    "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
    "created_on": createdOn,
    "modified_on": modifiedOn,
    "submit_in_zone": submitInZone,
    "default": listDefault,
    "fields_size": fieldsSize,
  };
}
