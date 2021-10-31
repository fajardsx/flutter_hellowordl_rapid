import 'package:flutter/material.dart';

class EditTextField extends StatefulWidget {
  const EditTextField({required this.fieldkey,
      this.maxLength,
      this.obscure = false,
      this.hintText,
      this.onsaved,
      this.icondata,
      this.validator
      });
  final Key fieldkey;
  final int? maxLength;
  final bool obscure;
  final String? hintText;
  final FormFieldSetter<String>? onsaved;
  final IconData? icondata;
  final FormFieldValidator<String>? validator;
  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //onSaved: (input) => _email = input!,
      onSaved: widget.onsaved,
      obscureText: widget.obscure,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.icondata,
          color: Colors.blue,
        ),
      ),
    );
  }
}
