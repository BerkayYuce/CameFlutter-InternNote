import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  IconData icon ;
  final String label;
  //Function(String) callback;
  final bool autofocus;
   CustomTextField({
     super.key,
     required this.icon,
     //required this.callback,
     required this.label,
     required this.autofocus,
   });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      decoration: InputDecoration(border: OutlineInputBorder(),
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),
      ),
    );

  }
}
