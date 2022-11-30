import 'dart:convert';

CreateTeamModel createTeamModelFromJson(String str) => CreateTeamModel.fromJson(json.decode(str));

String createTeamModelToJson(CreateTeamModel data) => json.encode(data.toJson());

class CreateTeamModel {
  CreateTeamModel({
    this.fullname,
    this.password,
    this.email,
    this.phoneNo,
    this.country,
    this.organizationName,
  });

  String? fullname;
  String? password;
  String? email;
  String? phoneNo;
  String? country;
  String? organizationName;

  factory CreateTeamModel.fromJson(Map<String, dynamic> json) => CreateTeamModel(
    fullname: json["fullname"],
    password: json["password"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    country: json["country"],
    organizationName: json["organization_name"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "password": password,
    "email": email,
    "phoneNo": phoneNo,
    "country": country,
    "organization_name": organizationName,
  };
}