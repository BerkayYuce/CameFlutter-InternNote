import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  //final String page;
  final Widget destination;
  final String text;

  CustomButton({
    super.key,
    //required this.page,
    required this.destination,
    required this.text,
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
        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => widget.destination),);},
        child: Text(widget.text),
      ),
    );
  }
}
