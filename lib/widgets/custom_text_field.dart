import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  IconData icon ;
  final String label;
  //Function(String) callback;
  final bool autofocus;
  bool passwordVisible=false;
  final bool isPassword;
  CustomTextField({
     super.key,
     required this.icon,
     //required this.callback,
     required this.label,
     required this.autofocus,
    required this.isPassword,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();


}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  void initState(){
    super.initState();
    widget.passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      obscureText: widget.passwordVisible,
      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(border: OutlineInputBorder(),
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

    );

  }
}
