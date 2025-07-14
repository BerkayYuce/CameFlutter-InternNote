
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final bool autofocus;
  final bool isPassword;
  final Function(String) callback;
  final TextEditingController controller;
  bool passwordVisible = false;

  CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.autofocus,
    required this.isPassword,
    required this.callback,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {

  @override
  void initState(){
    super.initState();
    widget.passwordVisible=false;
  }
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autofocus,
      obscureText: widget.passwordVisible,

      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(border: OutlineInputBorder(),
          hint: Text(widget.hint),
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),

          suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(widget.passwordVisible
              ? Icons.visibility
              : Icons.visibility_off),
          onPressed: () {
            setState(
                  () {
                widget.passwordVisible = !(widget.passwordVisible);
              },
            );
          },
        )
            : null
      ),

      onChanged: (text) => widget.callback(text),
    );

  }
}
