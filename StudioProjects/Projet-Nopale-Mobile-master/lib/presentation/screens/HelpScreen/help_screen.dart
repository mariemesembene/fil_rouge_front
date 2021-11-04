
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/presentation/screens/HelpScreen/components/body.dart';
import 'package:projet_nopale_mobile/presentation/screens/otp/components/body.dart';


class HelpScreen extends StatelessWidget {
   static String routeName = "/help";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aide"),
      ),
      body: Bodyp(),
    );
  }
}
