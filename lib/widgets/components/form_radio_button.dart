import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worx/constants.dart';
import 'package:worx/data/model/fields/radio_button_model.dart';
import 'package:worx/data/model/value/radiobutton_value.dart';

class FormRadioButton extends StatefulWidget {
  RadioButton field;
  RadioButtonValue? value;

  FormRadioButton({Key? key, required this.field, value}) : super(key: key);

  @override
  State<FormRadioButton> createState() => _FormRadioButtonState();
}

class _FormRadioButtonState extends State<FormRadioButton> {
  late Option _radioButtonValue;

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
          DynamicHeightGridView(
            itemCount: widget.field.options.length,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              builder: (context, index) => LabeledRadio(
                  value: widget.field.options[index],
                  groupValue: _radioButtonValue,
                  onChanged: (value) {
                    setState(() {
                      _radioButtonValue = value as Option;
                    });
                  })),
          margin16pxHeight,
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.value != null && widget.value?.valueIndex != null){
      _radioButtonValue = widget.field.options[widget.value!.valueIndex!];
    } else {
      _radioButtonValue = widget.field.options[0];
    }
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final Option groupValue;
  final Option value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child : Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio<Option>(
                activeColor: Theme.of(context).colorScheme.primary,
                groupValue: groupValue,
                value: value,
                onChanged: (Option? newValue) {
                  onChanged(newValue);
                },
              ),
            ),
            const SizedBox(width: 9,),
            Text(value.label ??= '', style: descrField(context),),
          ],
      ),
    );
  }
}
