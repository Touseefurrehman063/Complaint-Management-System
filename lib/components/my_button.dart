import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  String text;
  Color backgroundColor;
  double buttonwidth;
  double buttonheight;
  VoidCallback onPress;
  Color textColor;
  Color? borderColor;
  double? radius;
  double? textfontsize;
  // dynamic method;

  MyButton({
    super.key,
    required this.buttonheight,
    required this.text,
    required this.backgroundColor,
    required this.buttonwidth,
    required this.onPress,
    required this.textColor,
    this.borderColor,
    required this.radius,
    required this.textfontsize,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: widget.onPress,
        splashColor: widget.textColor,
        child: Container(
          height: widget.buttonheight,
          width: widget.buttonwidth,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.radius!),
              border: Border.all(
                color: widget.borderColor ?? widget.backgroundColor,
                width: 1,
              )),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.textfontsize,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
