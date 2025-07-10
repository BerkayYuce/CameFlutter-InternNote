
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  IconData icon ;
  final String label;
  Function(String) callback;
  final bool autofocus;
  bool passwordVisible=false;
  final bool isPassword;
  String hint;
  final controller = TextEditingController();
  final text = '';
  //final VoidCallback onPressed;

  CustomTextField({
     super.key,
     required this.icon,
     required this.callback,
     required this.label,
     required this.autofocus,
    required this.isPassword,
    required this.hint,
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


  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = widget.controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      //return 'Can\'t be empty';
      return widget.callback("Cant be empty") ;
    }
    if (text.length < 4) {
      //return 'Too short';
      return widget.callback("Too short");
    }
    // return null if the text is valid
    return widget.callback("Valid");
  }
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      /*
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      }, */
      controller: widget.controller,
      autofocus: widget.autofocus,
      obscureText: widget.passwordVisible,
      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(border: OutlineInputBorder(),
        errorText: _errorText, hint: Text(widget.hint),
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
      onChanged: (text) => widget.callback(widget.controller.text),
    );

  }
}
