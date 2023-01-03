import 'package:flutter/material.dart';
import 'package:worx/constants.dart';
import 'package:worx/data/model/fields/radio_button_model.dart';
import 'package:worx/data/model/value/dropdown_value.dart';

import '../../data/model/fields/dropdown_model.dart';
import '../../theme/worx_theme.dart';

class FormDropDown extends StatefulWidget {
  DropDown field;
  DropDownValue? value;

  FormDropDown({Key? key, required this.field, required this.value}) : super(key: key);

  @override
  State<FormDropDown> createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  Option? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: marginHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.field.label ??= 'Dropdown', style: Theme.of(context).textTheme.headlineSmall,),
          margin8pxHeight,
          Container(
            decoration:
            BoxDecoration(
                color: Colors.black.withOpacity(0.06),
                borderRadius: BorderRadius.circular(6),),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: DropdownButton<Option>(
              isExpanded: true,
              underline: Container(width: 1, color: Colors.black.withOpacity(0.42),),
              style : descrField(context),
              hint: Text('Answer', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: WorxThemeData.grayText),),
              value: _dropDownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: widget.field.options.map((Option items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items.label),
                );
              }).toList(),
              onChanged: (Option? newValue) {
                setState(() {
                  _dropDownValue = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.value != null && widget.value?.valueIndex != null){
      _dropDownValue = widget.field.options[widget.value!.valueIndex!];
    }
  }
}
