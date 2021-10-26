import 'package:flutter/material.dart';

import 'button_big.dart';

class ContainerButtonStep extends StatefulWidget {
  final String title;
  final Color bgColor;
  final Color textColor;
  final VoidCallback action;

  const ContainerButtonStep(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.textColor,
      required this.action})
      : super(key: key);

  @override
  _ContainerButtonStepState createState() => _ContainerButtonStepState();
}

class _ContainerButtonStepState extends State<ContainerButtonStep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 50,
      child: ButtonBig(
          title: widget.title,
          bgColor: widget.bgColor,
          textColor: widget.textColor,
          action: widget.action),
    );
  }
}
