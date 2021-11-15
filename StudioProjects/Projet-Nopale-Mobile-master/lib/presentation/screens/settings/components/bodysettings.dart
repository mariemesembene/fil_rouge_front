import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/helpers/helpers.dart';
import 'package:projet_nopale_mobile/presentation/widgets/BottomBar/custom_bottom_app_bar.dart';
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
                showAlertDialog(context);

              },
            ),

              SizedBox(height: SizeConfig.screenHeight * 0.13),
              DefaultButton(
                color: greenColor,
                text: "Renouveller Carte",
                press: () {
                  showAlertDialog(context);

                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.13),
              DefaultButton(
                color: greenColor,
                text: "Désactiver Compte",
                press: () {

                  showAlertDialog(context);
                },
              ),


            ],
          ),
        ),
      ),
    );

  }


  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Annuler"),
      onPressed:  () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Désactivation"),
      content: Text("Voulez vous vraiment dèsactiver la carte?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  
}