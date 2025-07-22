import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class CustomButton extends StatefulWidget {

  bool isNavigation;
  final String text;
  final String? snackText;
  bool snack;
  bool onPress;
  Function(String) callback;

  CustomButton({
    super.key,
    required this.text,
    required this.snackText,
    required this.snack,
    required this.isNavigation,
    required this.callback,
    required this.onPress,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();

}

class _CustomButtonState extends State<CustomButton> {

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5),spreadRadius: 5,blurRadius: 15,offset: Offset(0, 3),),],),

      child: ElevatedButton(
        onPressed: widget.onPress ? ()
        {
          widget.callback("ok");

          final snackBar = SnackBar(

            content: Text(widget.snackText!),

            action: SnackBarAction(
              label: 'İptal',
              onPressed: () {
                //iptal işlemleri
              },
            ),

          );

          widget.snack
              ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
              : null;

        } :null ,
        child: Text(widget.text),
      ),
    );
  }
}
