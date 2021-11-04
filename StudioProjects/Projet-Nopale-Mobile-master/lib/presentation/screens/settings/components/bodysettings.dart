import 'package:flutter/cupertino.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/helpers/helpers.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Buttons/DefaultButton/default_button.dart';

class Bodysettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.15),
            DefaultButton(
              color: greenColor,
              text: "Désactiver Carte",
              press: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),

              SizedBox(height: SizeConfig.screenHeight * 0.13),
              DefaultButton(
                color: greenColor,
                text: "Renouveller Carte",
                press: () {
                  Navigator.pushNamed(context, '/signin');
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.13),
              DefaultButton(
                color: greenColor,
                text: "Désactiver Compte",
                press: () {
                  Navigator.pushNamed(context, '/signin');
                },
              ),


            ],
          ),
        ),
      ),
    );
  }


}