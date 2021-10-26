import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/connexion/components/app_bar_inscription/app_bar_inscription.dart';
import 'package:book_yonn_mobile/views/connexion/components/buttons/button_big.dart';
import 'package:book_yonn_mobile/views/connexion/components/form/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'connexion_form_steps.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_home.dart';

InscriptionFormSteps inscriptionFormSteps = new InscriptionFormSteps();

class ConnexionsForm extends StatefulWidget {
  const ConnexionsForm({Key? key}) : super(key: key);

  @override
  _ConnexionsFormState createState() => _ConnexionsFormState();
}

class _ConnexionsFormState extends State<ConnexionsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarInscription(
            stepperVisibily: false,
            numberStep: inscriptionFormSteps.getNumberStep()),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(
                'assets/icones/logoconnexion.png',
              ),
              height: 50.0,
              width: 400.0,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 335,
            height: 60,
            child: CustomTextFormField(label: 'Email'),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            width: 335,
            height: 60,
            child: CustomTextFormField(
              label: 'Mot de passe',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: colorLightGray,
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),
          Container(
            width: 334,
            height: 50,
            child: ButtonBig(
              title: 'Je me connecte',
              bgColor: Colors.blueAccent.shade700,
              textColor: colorWhite,
              action: _navigateToAbonneCenter,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            child: Text(
              'J\'ai oublié mon mot de passe',
              style: TextStyle(
                  color: Colors.blueAccent.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 95,
          ),
          Container(
            child: new RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'Pas encore de compte? ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display Regular',
                      color: Colors.grey,
                    ),
                  ),
                  new TextSpan(
                    text: 'S\'inscire',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18,
                    ),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InscriptionHome()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ]),
      )),
    );
  }

  void navigateToInscriptionForm() {
    Navigator.pushNamed(context, '/connexion_form');
  }

  Future<void> _navigateToAbonneCenter() async{
    await Navigator.pushNamed(context, '/abonne_center');
  }
}
