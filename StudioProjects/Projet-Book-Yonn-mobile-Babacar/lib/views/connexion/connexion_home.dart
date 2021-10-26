import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/connexion/components/buttons/button_big.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'components/buttons/button_social_inscription.dart';

class ConnexionsHome extends StatefulWidget {
  const ConnexionsHome({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<ConnexionsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 58.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(
                'assets/icones/logoconnexion.png',
              ),
              height: 100.0,
              width: 280.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Bienvenue sur Book Yoon',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'CircularStdBold',
                fontWeight: FontWeight.bold,
                color: colorDarkGray,
              ),
            ),
          ),
          SizedBox(
            height: 15,
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
                        navigateToInscriptionForm();
                      },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Se connecter avec',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'SF Pro Display Regular',
                color: colorDarkGray,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonSocialConnexion(
                  text: 'assets/icones/google.png',
                  onPressed: navigateToAbonneMain,
                ),
                ButtonSocialConnexion(
                  text: 'assets/icones/facebook.png',
                  onPressed: navigateToAbonneMain,
                ),
                ButtonSocialConnexion(
                  text: 'assets/icones/apple.png',
                  onPressed: navigateToAbonneMain,
                ),
              ],
            ),
          ),
          SizedBox(height: 70),
          Container(
            child: Text(
              'Ou',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'SF Pro Display Regular',
                color: colorDarkGray,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 305,
            height: 50,
            child: ButtonBig(
              title: 'Se connecter avec un email',
              bgColor: colorBlue,
              textColor: colorWhite,
              action: navigateToConnexionForm,
            ),
          ),
          SizedBox(
            height: 270,
          ),
          Container(
            child: TextButton(
                onPressed: null,
                child: Text('J\'ai déjà un compte',
                    style: TextStyle(
                      fontFamily: 'Circular Std Bold',
                      fontSize: 19,
                      letterSpacing: 0.24,
                      color: colorBlue,
                    ))),
          ),
        ]),
      )),
    );
  }

  void navigateToInscriptionForm() {
    Navigator.pushNamed(context, '/inscription_home');
  }

  void navigateToAbonneMain() {
    // Navigator.pushNamed(context, '/abonne_center');
  }

  void navigateToConnexionForm() {
    Navigator.pushNamed(context, '/connexion_form');
  }
}
