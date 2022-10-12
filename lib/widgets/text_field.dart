import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
    final String title;
    final TextInputType keyboardType;
    final bool isPasswordField;
    Function(String) onSave;

    FormTextField(
      {Key? key,
      required this.title,
      this.keyboardType = TextInputType.text,
      this.isPasswordField = false,
      required this.onSave})
      : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _isPasswordTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(widget.title, style: Theme.of(context).textTheme.headlineSmall,),
                SizedBox(height: 10,),
              TextFormField(
            keyboardType: widget.keyboardType,
            obscureText: _isPasswordTextVisible,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: 'Enter ${widget.title}',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.42),
                ),
              ),
              fillColor: Colors.black.withOpacity(0.06),
              filled: true,
              suffix: widget.isPasswordField
                  ? IconButton(
                      padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                      icon : Icon(Icons.remove_red_eye, color: Colors.black54),
                      onPressed: () {
                        setState(() {
                          _isPasswordTextVisible = !_isPasswordTextVisible;
                        });
                      },
                    )
                  : null,
            ),
            onChanged: (String? newValue) {
              if (newValue != null) widget.onSave(newValue!);
            },
            validator: (String? value) {
              return (value == null) ? 'Please fill the form' : null;
            },
          ),
        ],
      ),
    );
  }
}

