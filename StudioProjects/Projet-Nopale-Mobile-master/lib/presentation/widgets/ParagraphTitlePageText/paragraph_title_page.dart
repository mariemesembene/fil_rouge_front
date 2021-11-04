import 'package:flutter/material.dart';

class ParagraphTitlePage extends StatelessWidget {
  const ParagraphTitlePage({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
    );
  }
}
