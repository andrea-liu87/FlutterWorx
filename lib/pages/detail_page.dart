import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worx/data/model/fields/radio_button_model.dart';
import 'package:worx/data/model/value/radiobutton_value.dart';
import 'package:worx/data/model/value/text_value.dart';
import 'package:worx/widgets/app_bar.dart';

import '../data/model/fields/field_model.dart';
import '../data/model/value/value.dart';
import '../providers/detail_form_provider.dart';
import '../widgets/components/form_radio_button.dart';
import '../widgets/components/form_text_field.dart';

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
            return buildFormComponent(form, value, (String id, Value? value) {
              detailProvider.saveValue(id, value);
            });
          },
          separatorBuilder: (BuildContext context, int index) => Container(
                height: 2,
                color: Colors.black54,
              ),
          itemCount: detailProvider.submissionForm.fields.length),
    );
  }

  Widget buildFormComponent(
      Field field, Value? value, Function(String, Value) saveValue) {
    var id = field.id!;
    if (field.type == FieldType.text) {
      return FormTextField(
        title: field.label ??= '',
        initialValue: (value == null) ? '' : (value as TextValue).value ??= '',
        onSave: (String text) {
          saveValue(id, TextValue(value: text));
        },
      );
    } else if (field.type == FieldType.radio_group) {
      return FormRadioButton(
        field: field as RadioButton,
        value: (value != null) ? value as RadioButtonValue : null,
      );
    }
    return Container(
      child: Text('unidentified field'),
    );
  }
}
