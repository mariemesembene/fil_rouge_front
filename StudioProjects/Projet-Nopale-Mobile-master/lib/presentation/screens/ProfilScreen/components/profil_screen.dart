
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/presentation/screens/ProfilScreen/components/bodyprofil.dart';

class profilScreen extends StatelessWidget {
  static String routeName = "/help";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Bodyprofil(),
    );
  }
}