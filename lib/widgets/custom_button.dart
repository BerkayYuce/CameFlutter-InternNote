import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  //Function(String,bool) snackText2;
  final Widget destination;
  final String text;
  final String snackText;
  bool isSnack;
  CustomButton({
    super.key,
    required this.destination,
    required this.text,
    required this.snackText,
    required this.isSnack,
    //required this.snackText2,

  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
/*
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5),spreadRadius: 5,blurRadius: 15,offset: Offset(0, 3),),],),

      child: ElevatedButton(
        onPressed:(){
          /*setState(() {_text.text.isEmpty ? _validate = true : _validate = false;}); */
          Navigator.push(context, MaterialPageRoute(builder: (context) => widget.destination),);
          final snackBar = SnackBar(
            content: Text(widget.snackText),
            action: SnackBarAction(
              label: 'İptal',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          widget.isSnack
              ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
            : null;
        },
        child: Text(widget.text),
      ),
    );
  }
}
