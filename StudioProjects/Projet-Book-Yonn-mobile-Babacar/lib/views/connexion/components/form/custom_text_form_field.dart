import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const CustomTextFormField(
      {Key? key, required this.label, this.prefixIcon, this.suffixIcon})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: colorNormalGray,
            fontFamily: 'SF Pro Display Regular',
            fontSize: 18,
          ),
          filled: true,
          fillColor: colorGray,
          prefix: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide.none)),
    );
  }
}
