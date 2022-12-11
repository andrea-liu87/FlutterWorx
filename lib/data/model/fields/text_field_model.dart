import 'package:worx/data/model/fields/field_model.dart';

class TextField extends Field{

  TextField({
    this.minLength,
    this.maxLength,
  });

  int? minLength;
  int? maxLength;

  factory TextField.fromJson(Map<String, dynamic> json) => TextField(
    minLength: json["min_length"],
    maxLength: json["max_length"],
  );

  Map<String, dynamic> toJson() => {
    "min_length": minLength,
    "max_length": maxLength,
  };
}