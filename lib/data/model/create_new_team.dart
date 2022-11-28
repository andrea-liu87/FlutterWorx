import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CreateNewTeam {
  String name;
  String password;
  String email;
  String phone;
  String organizationName;
  String country;

  CreateNewTeam({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.organizationName,
    required this.country
  });

  // factory CreateNewTeam.fromJson(Map<String, dynamic> json) => _$CreateNewTeamFromJson(json);
  // Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}