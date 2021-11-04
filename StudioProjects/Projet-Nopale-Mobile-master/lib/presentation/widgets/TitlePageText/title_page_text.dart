import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';

class TitlePageText extends StatelessWidget {
  const TitlePageText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: greenColor,
          fontSize: getProportionateScreenWidth(28),
          fontWeight: FontWeight.bold),
    );
  }
}
