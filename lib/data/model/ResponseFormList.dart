

// class ResponseFormList {
//   bool? success;
//   List<EmptyForm>? list;
//
//   ResponseFormList({this.success, this.list});
//
//   ResponseFormList.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['list'] != null) {
//       list = <List>[];
//       json['list'].forEach((v) {
//         list!.add(new List.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.list != null) {
//       data['list'] = this.list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
//
//   static ResponseFormList withErrorCode(ApplicationError errorCode) {
//     final ResponseFormList response = ResponseFormList();
//     response._errorCode = errorCode;
//     return response;
//   }
//
//   ApplicationError? get errorCode => _errorCode;
// }
//
// class EmptyForm {
//   int? id;
//   String? label;
//   String? description;
//   List<Fields>? fields;
//   String? createdOn;
//   String? modifiedOn;
//   bool? submitInZone;
//   bool? defaultt;
//   int? fieldsSize;
//
//   EmptyForm(
//       {this.id,
//       this.label,
//       this.description,
//       this.fields,
//       this.createdOn,
//       this.modifiedOn,
//       this.submitInZone,
//       this.defaultt,
//       this.fieldsSize});
//
//   EmptyForm.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     label = json['label'];
//     description = json['description'];
//     if (json['fields'] != null) {
//       fields = <Fields>[];
//       json['fields'].forEach((v) {
//         fields!.add(new Fields.fromJson(v));
//       });
//     }
//     createdOn = json['created_on'];
//     modifiedOn = json['modified_on'];
//     submitInZone = json['submit_in_zone'];
//     defaultt = json['default'];
//     fieldsSize = json['fields_size'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['label'] = this.label;
//     data['description'] = this.description;
//     if (this.fields != null) {
//       data['fields'] = this.fields!.map((v) => v.toJson()).toList();
//     }
//     data['created_on'] = this.createdOn;
//     data['modified_on'] = this.modifiedOn;
//     data['submit_in_zone'] = this.submitInZone;
//     data['default'] = this.defaultt;
//     data['fields_size'] = this.fieldsSize;
//     return data;
//   }
// }
//
// class Fields {
//   String? id;
//   String? label;
//   String? description;
//   String? type;
//   bool? required;
//   List<Group>? group;
//   int? minChecked;
//   int? maxChecked;
//   bool? disableFuture;
//   bool? disablePast;
//   List<Options>? options;
//   int? maxFiles;
//   int? maxFileSize;
//   int? minFileSize;
//   List<String>? allowedExtensions;
//   bool? allowGalleryUpload;
//   int? maxStars;
//   String? icon;
//   int? minLength;
//   int? maxLength;
//
//   Fields(
//       {this.id, this.label, this.description, this.type, this.required, this.group, this.minChecked, this.maxChecked, this.disableFuture, this.disablePast, this.options, this.maxFiles, this.maxFileSize, this.minFileSize, this.allowedExtensions, this.allowGalleryUpload, this.maxStars, this.icon, this.minLength, this.maxLength});
//
//   Fields.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     label = json['label'];
//     description = json['description'];
//     type = json['type'];
//     required = json['required'];
//     if (json['group'] != null) {
//       group = <Group>[];
//       json['group'].forEach((v) {
//         group!.add(new Group.fromJson(v));
//       });
//     }
//     minChecked = json['min_checked'];
//     maxChecked = json['max_checked'];
//     disableFuture = json['disable_future'];
//     disablePast = json['disable_past'];
//     if (json['options'] != null) {
//       options = <Options>[];
//       json['options'].forEach((v) {
//         options!.add(new Options.fromJson(v));
//       });
//     }
//     maxFiles = json['max_files'];
//     maxFileSize = json['max_file_size'];
//     minFileSize = json['min_file_size'];
//     allowedExtensions = json['allowed_extensions'].cast<String>();
//     allowGalleryUpload = json['allow_gallery_upload'];
//     maxStars = json['max_stars'];
//     icon = json['icon'];
//     minLength = json['min_length'];
//     maxLength = json['max_length'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['label'] = this.label;
//     data['description'] = this.description;
//     data['type'] = this.type;
//     data['required'] = this.required;
//     if (this.group != null) {
//       data['group'] = this.group!.map((v) => v.toJson()).toList();
//     }
//     data['min_checked'] = this.minChecked;
//     data['max_checked'] = this.maxChecked;
//     data['disable_future'] = this.disableFuture;
//     data['disable_past'] = this.disablePast;
//     if (this.options != null) {
//       data['options'] = this.options!.map((v) => v.toJson()).toList();
//     }
//     data['max_files'] = this.maxFiles;
//     data['max_file_size'] = this.maxFileSize;
//     data['min_file_size'] = this.minFileSize;
//     data['allowed_extensions'] = this.allowedExtensions;
//     data['allow_gallery_upload'] = this.allowGalleryUpload;
//     data['max_stars'] = this.maxStars;
//     data['icon'] = this.icon;
//     data['min_length'] = this.minLength;
//     data['max_length'] = this.maxLength;
//     return data;
//   }
// }
//
// class Group {
//   String? label;
//
//   Group({this.label});
//
//   Group.fromJson(Map<String, dynamic> json) {
//     label = json['label'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label'] = this.label;
//     return data;
//   }
// }