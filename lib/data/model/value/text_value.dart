import '../response_device_info.dart';

class TextValue extends Value{

  TextValue({
    this.value
  });

  String? value;

  factory TextValue.fromJson(Map<String, dynamic> json) => TextValue(
    value: json["values"]
  );

  Map<String, dynamic> toJson() => {
    "values": value
  };
}