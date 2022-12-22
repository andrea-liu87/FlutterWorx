import 'package:flutter/material.dart';
import 'package:worx/data/model/form/empty_form.dart';

import '../data/model/form/submission_form.dart';
import '../data/model/value/value.dart';
import '../data/remote/remote_repository.dart';

class DetailFormProvider with ChangeNotifier {
  final RemoteRepository _remoteRepository ;

  DetailFormProvider(this._remoteRepository);

  SubmissionForm _submissionForm = SubmissionForm();
  SubmissionForm get submissionForm => _submissionForm;

  void startFillEmptyForm(EmptyForm form){
    _submissionForm = SubmissionForm.fromEmptyForm(form);
  }

  void saveValue(String id, Value? value){
    if (value == null){
      _submissionForm.values.remove(id);
    } else {
      _submissionForm.values[id] = value;
    }
  }
}