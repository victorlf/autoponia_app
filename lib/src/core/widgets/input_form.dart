import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final int maxLength;
  const InputForm(
      {Key? key,
      required this.controller,
      required this.label,
      required this.maxLength})
      : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
      maxLength: widget.maxLength,
      validator: (String? value) {
        if (value != null) {
          value = value.trim();
          return value.isEmpty ? 'Campo não pode ser vazio' : null;
        } else {
          return 'Campo não pode ser vazio';
        }
      },
    );
  }
}
