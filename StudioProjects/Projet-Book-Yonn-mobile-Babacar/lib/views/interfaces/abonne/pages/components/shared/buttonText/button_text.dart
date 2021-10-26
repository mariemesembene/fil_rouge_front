import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  const ButtonText(
      {Key? key,
      required this.color,
      required this.onPressed,
      required this.text})
      : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final String text;

  @override
  _ButtonTextState createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        widget.text,
        style: TextStyle(
            color: widget.color, fontFamily: 'Circular Std Bold', fontSize: 16),
      ),
      onPressed: widget.onPressed,
    );
  }
}
