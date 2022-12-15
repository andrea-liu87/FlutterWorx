import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/widgets/app_bar.dart';

import '../data/model/fields/field_model.dart';
import '../data/model/value/value.dart';
import '../providers/detail_form_provider.dart';
import '../widgets/text_field.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    DetailFormProvider detailProvider = Provider.of(context);
    return Scaffold(
      appBar: WelcomeAppBar(
        title: detailProvider.submissionForm.label ??= 'No Label',
        progress: 0.3,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var form = detailProvider.submissionForm.fields[index];
            var id = form.id;
            var value = detailProvider.submissionForm.values[id];
            return buildFormComponent(
              form, value);},
          separatorBuilder: (BuildContext context, int index) => Container(
            height: 2,
            color: Colors.black54,
          ),
          itemCount: detailProvider.submissionForm.fields.length),
    );
  }

  Widget buildFormComponent(Field field, Value? value){
    if (field.type == FieldType.text){
      return FormTextField(
          title: field.label ??= '',
          onSave: (String text) {  },
      );
    }
    return Container(child: Text('field'),);
  }
}