import 'package:flutter/material.dart';
import 'package:worx/data/model/fields/check_box_model.dart';

import '../../constants.dart';
import '../../data/model/value/checkbox_value.dart';

class FormCheckBox extends StatefulWidget {
  CheckBox field;
  CheckBoxValue? value;

  FormCheckBox({Key? key, required this.field, value}) : super(key: key);

  @override
  State<FormCheckBox> createState() => _FormCheckBoxState();
}

class _FormCheckBoxState extends State<FormCheckBox> {
  late List<bool> _checkBoxValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: marginHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          margin16pxHeight,
          Text(widget.field.label ??= 'Radio Button', style: titleField(context),),
          margin8pxHeight,
          if (widget.field.description != null || widget.field.description != '') Text(widget.field.description!, style: descrField(context),),
          margin8pxHeight,
          ListView.separated(
            separatorBuilder: (context, index){return margin8pxHeight;},
            itemCount: widget.field.options.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                return LabeledCheckBox(
                    value: _checkBoxValue[index],
                    onChanged: (value) {
                      setState(() {
                        _checkBoxValue[index] = value;
                      });
                    },
                    label: widget.field.options[index].label);
              }),
          margin16pxHeight,
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.value != null && widget.value!.values != null){
      _checkBoxValue = widget.value!.values;
    } else {
      _checkBoxValue = widget.field.options.map((e) => false).toList();
    }
  }
}

class LabeledCheckBox extends StatelessWidget {
  LabeledCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });
  
  final bool value;
  String? label;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value) {
          onChanged(value);
        }
      },
      child : Row(
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              activeColor: Theme.of(context).colorScheme.primary,
              value: value,
              onChanged: (newValue) {
                onChanged(newValue);
              },
            ),
          ),
          const SizedBox(width: 9,),
          Text(label ??= '', style: descrField(context),),
        ],
      ),
    );
  }
}
