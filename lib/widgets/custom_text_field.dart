//
// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   final IconData icon;
//   final String label;
//   final String hint;
//   final bool autofocus;
//   final bool isPassword;
//   final Function(String) callback;
//   final TextEditingController controller;
//   bool passwordVisible = false;
//   final bool isValid;
//   final String? errorText;
//
//   CustomTextField({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.hint,
//     required this.autofocus,
//     required this.isPassword,
//     required this.callback,
//     required this.controller,
//     required this.isValid,
//     this.errorText,
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
//
// class _CustomTextFieldState extends State<CustomTextField> {
//
//   @override
//   void initState(){
//     super.initState();
//     widget.passwordVisible=false;
//   }
//
//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return TextFormField(
//       controller: widget.controller,
//       autofocus: widget.autofocus,
//       obscureText: widget.passwordVisible,
//
//       onTapUpOutside: (event) {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//
//
//
//       decoration: InputDecoration(
//
//         errorText: widget.errorText,
//         border: OutlineInputBorder(
//
//           // borderSide: BorderSide(
//           //   color: widget.isValid ? Colors.red : Colors.red,
//           // ),
//
//         ),
//
//           hint: Text(widget.hint),
//         labelText: widget.label,
//         prefixIcon: Icon(widget.icon),
//
//           suffixIcon: widget.isPassword ? IconButton(
//             icon: Icon(widget.passwordVisible
//               ? Icons.visibility
//               : Icons.visibility_off),
//
//           onPressed: () {
//               setState(() {
//                 widget.passwordVisible = !(widget.passwordVisible);
//               },
//
//             );
//           },
//         )
//             : null
//       ),
//
//       onChanged: (text) => widget.callback(text),
//     );
//
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final bool autofocus;
  final bool isPassword;
  final Function(String) callback;
  final TextEditingController controller;
  final bool isValid;
  final String? errorText;
  final bool readOnly;



  CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.autofocus,
    required this.isPassword,
    required this.callback,
    required this.controller,
    required this.isValid,
    this.errorText,
    this.readOnly = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;  // passwordVisible'ı burada tanımlıyoruz.

  @override
  void dispose() {
    widget.controller.dispose(); // Controller'ı dispose ediyoruz
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

        onTapUpOutside: (event) {
         FocusManager.instance.primaryFocus?.unfocus();
       },

      controller: widget.controller,
      autofocus: widget.autofocus,
      obscureText: widget.isPassword ? !passwordVisible : false,  // Şifreyi gizlemek için passwordVisible kontrolü
      readOnly: widget.readOnly,

      decoration: InputDecoration(
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isValid ? Colors.blue : Colors.red,  // Validasyon durumuna göre renk değişimi
          ),
        ),
        hintText: widget.hint,
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(passwordVisible
              ? Icons.visibility
              : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible; // Şifre görünürlüğünü değiştiriyoruz
            });
          },
        )
            : null,
      ),
      onChanged: (text) => widget.callback(text),  // Girdiği metni geri çağırıyoruz
    );
  }
}
