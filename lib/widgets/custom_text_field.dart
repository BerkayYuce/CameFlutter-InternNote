
// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final bool autofocus;
  final bool isPassword;
  final TextEditingController controller;
  final String? errorText;
  final bool readOnly;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.hint = '',
    this.autofocus = false,
    this.isPassword = false,
    required this.controller,
    this.errorText,
    this.readOnly = false,
    this.onChanged, // onChanged opsiyonel yapıldı
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = !widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      controller: widget.controller,
      autofocus: widget.autofocus,
      obscureText: widget.isPassword ? !passwordVisible : false,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,

      decoration: InputDecoration(
        errorText: widget.errorText,
        border: const OutlineInputBorder(),
        hintText: widget.hint,
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        )
            : null,
      ),
    );
  }
}