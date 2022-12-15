// To parse this JSON data, do
//
//     final submissionForm = submissionFormFromJson(jsonString);

import 'package:worx/data/model/form/empty_form.dart';
import 'package:worx/data/model/response_device_info.dart';

import '../fields/field_model.dart';

class SubmissionForm {
  SubmissionForm({
    this.id,
    this.label,
    this.description,
    this.fields  = const <Field>[],
    this.values = const <String, Value>{},
    this.source,
    this.attachments  = const <Attachment>[],
    this.templateId,
    this.createdOn,
    this.modifiedOn,
    this.submitDate,
    this.submitInZone,
    this.submitLocation,
  });

  int? id;
  String? label;
  String? description;
  List<Field> fields;
  Map<String, dynamic> values;
  Source? source;
  List<Attachment> attachments;
  int? templateId;
  String? createdOn;
  String? modifiedOn;
  String? submitDate;
  bool? submitInZone;
  SubmitLocation? submitLocation;

  factory SubmissionForm.fromJson(Map<String, dynamic> json) => SubmissionForm(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
    values: Map<String, dynamic>.from(json["values"]),
    source: Source.fromJson(json["source"]),
    attachments: List<Attachment>.from(
        json["attachments"] == null
        ? []
        : json["attachments"].map((x) => Attachment.fromJson(x))),
    templateId: json["template_id"],
    createdOn: json["created_on"],
    modifiedOn: json["modified_on"],
    submitDate: json["submit_date"],
    submitInZone: json["submit_in_zone"],
    submitLocation: SubmitLocation.fromJson(json["submit_location"]),
  );

  factory SubmissionForm.fromEmptyForm(EmptyForm form) => SubmissionForm(
    id: form.id,
    label: form.label,
    description: form.description,
    fields: form.fields,
      createdOn: form.createdOn,
    modifiedOn: form.modifiedOn
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "description": description,
    "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
    "values": values,
    "source": source?.toJson(),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "template_id": templateId,
    "created_on": createdOn,
    "modified_on": modifiedOn,
    "submit_date": submitDate,
    "submit_in_zone": submitInZone,
    "submit_location": submitLocation?.toJson(),
  };
}

class Attachment {
  Attachment({
    this.name,
    this.path,
    this.fileId,
    this.mediaId,
  });

  String? name;
  String? path;
  int? fileId;
  String? mediaId;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    name: json["name"],
    path: json["path"],
    fileId: json["file_id"],
    mediaId: json["media_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "path": path,
    "file_id": fileId,
    "media_id": mediaId,
  };
}

class Source {
  Source({
    this.type,
    this.label,
  });

  String? type;
  String? label;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    type: json["type"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "label": label,
  };
}

class SubmitLocation {
  SubmitLocation({
    this.address,
    this.lat,
    this.lng,
  });

  String? address;
  double? lat;
  double? lng;

  factory SubmitLocation.fromJson(Map<String, dynamic> json) => SubmitLocation(
    address: json["address"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "lat": lat,
    "lng": lng,
  };
}
