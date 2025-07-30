
// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';
// custom_text_field.dart import'ına burada gerek yok

class CustomButton extends StatelessWidget { // StatefulWidget yerine StatelessWidget kullanıldı
  final String text;
  final VoidCallback? onPressed; // onPressed parametresi eklendi, boş olabilir (null)

  const CustomButton({ // const constructor eklendi
    super.key,
    required this.text,
    this.onPressed, // onPress'e karşılık geliyor, null ise buton devre dışı olur
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // withValues yerine withOpacity
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed, // Doğrudan dışarıdan gelen onPressed'i kullanıyoruz
        style: ElevatedButton.styleFrom(
          // ElevatedButton'a daha iyi bir stil vermek için varsayılanlar ayarlanabilir
          // Örneğin, butonun genişliği Container yerine burada kontrol edilebilir
          minimumSize: const Size(double.infinity, 48), // Minimum genişlik ve yükseklik
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Köşe yuvarlaklığı Container ile uyumlu
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16), // Yazı stili
        ),
      ),
    );
  }
}