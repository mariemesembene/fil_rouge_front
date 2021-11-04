import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';

enum BigButtonType { contained, outiled }

class BigButton extends StatefulWidget {
  final String title;
  final Color color;
  final BigButtonType bigButtonType;
  final VoidCallback onPressed;

  const BigButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.bigButtonType,
      required this.onPressed})
      : super(key: key);

  @override
  _BigButtonState createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: bigButtonStyle(),
      child: Text(
        widget.title,
        style: textTitleStyle(),
      ),
      onPressed: widget.onPressed,
    );
  }

  // Style of BigButton
  ButtonStyle bigButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(
          widget.bigButtonType == BigButtonType.contained
              ? widget.color
              : widget.bigButtonType == BigButtonType.outiled
                  ? whiteColor
                  : null,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: widget.color))));
  }

  //Style of textButton
  TextStyle textTitleStyle() {
    return TextStyle(
        color: widget.bigButtonType == BigButtonType.contained
            ? Colors.white
            : widget.bigButtonType == BigButtonType.outiled
                ? widget.color
                : null);
  }
}
