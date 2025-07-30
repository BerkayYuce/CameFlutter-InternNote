
// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final bool autofocus;
  final bool isPassword;
  final TextEditingController controller;
  final String? errorText; // Hata mesajı
  final bool readOnly;
  final ValueChanged<String>? onChanged; // onChanged eklendi

  const CustomTextField({ // const constructor eklendi
    super.key,
    required this.icon,
    required this.label,
    this.hint = '', // Hint'e varsayılan değer verilebilir
    this.autofocus = false, // autofocus'a varsayılan değer verilebilir
    this.isPassword = false, // isPassword'a varsayılan değer verilebilir
    required this.controller,
    this.errorText,
    this.readOnly = false,
    this.onChanged, // onChanged opsiyonel yapıldı
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool passwordVisible; // initState'te initialize edileceği için late olarak tanımlandı

  @override
  void initState() {
    super.initState();
    passwordVisible = !widget.isPassword; // isPassword true ise gizle, değilse göster
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
      onChanged: widget.onChanged, // Dışarıdan gelen onChanged'ı doğrudan kullanıyoruz

      decoration: InputDecoration(
        errorText: widget.errorText, // Hata mesajını göster
        border: const OutlineInputBorder(), // Varsayılan kenarlık. errorText varsa Flutter otomatik kırmızı yapar.
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