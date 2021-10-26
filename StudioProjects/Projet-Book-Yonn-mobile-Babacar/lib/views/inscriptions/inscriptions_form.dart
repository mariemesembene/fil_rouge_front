import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/app_bar_inscription/app_bar_inscription.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/buttons/button_big.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/steps/step1.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/steps/step3.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/steps/step4.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/steps/step5.dart';
import 'package:flutter/material.dart';
import 'components/steps/step2.dart';
import 'inscriptions_form_steps.dart';
import 'dart:io';

InscriptionFormSteps inscriptionFormSteps = new InscriptionFormSteps();

_InscriptionsFormState? inscriptionsFormState;

List<GlobalKey<FormState>> formKeys = [
  keyFormStep1,
  keyFormStep2,
  keyFormStep3,
  keyFormStep4,
  keyFormStep5,
];

class InscriptionsForm extends StatefulWidget {
  const InscriptionsForm({Key? key}) : super(key: key);

  @override
  _InscriptionsFormState createState() =>
      inscriptionsFormState = _InscriptionsFormState();
}

class InscriptionAbonneData {
  String nom = '';
  String prenom = '';
  String email = '';
  String adresse = '';
  String numeroTel = '';
  String dateNaissance = '';
  String password = '';
  String confirmPassword = '';
}

class _InscriptionsFormState extends State<InscriptionsForm> {
  final firstNameController = TextEditingController();
  final dateNaissController = TextEditingController();
  final adressController = TextEditingController();
  final numTelController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final numeroPermisController = TextEditingController();
  final numeroSerieVoiture = TextEditingController();
  bool isSwitch0n = false;
  File? storeImageProfil;
  File? storeImagePermis;

  Widget containerButtonSteps({title, bgColor, textColor, action}) {
    return Container(
      width: 158,
      height: 50,
      child: ButtonBig(
          title: title, bgColor: bgColor, textColor: textColor, action: action),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarInscription(
            stepperVisibily: true,
            numberStep: inscriptionFormSteps.getNumberStep()),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(31.0),
        child: inscriptionFormSteps.getCurrentSteps(),
      )),
      bottomNavigationBar: Container(
        height: 150.0,
        child: Row(
          mainAxisAlignment: inscriptionFormSteps.getNumberStep() != 0
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            Visibility(
              visible: inscriptionFormSteps.getNumberStep() != 0,
              child: containerButtonSteps(
                title: 'Préc.',
                action: precStep,
                bgColor: colorGray,
                textColor: colorDarkGray,
              ),
            ),
            containerButtonSteps(
              title: 'Suiv.',
              action: nextStep,
              bgColor: colorBlue,
              textColor: colorWhite,
            ),
          ],
        ),
      ),
    );
  }

  void precStep() {
    setState(() {
      inscriptionFormSteps.switchPrevStep();
    });
  }

  void nextStep() {
    setState(() {
      if (formKeys[inscriptionFormSteps.getNumberStep()]
              .currentState
              ?.validate() ==
          true) {
        // switch validation
        switch (inscriptionFormSteps.getNumberStep()) {
          case 2:
            if (step3state?.isSwitch0n == true) {
              inscriptionFormSteps.switchNextStep();
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: Text('Conditions d\'utilisation'),
                          content: Text(
                              'Veuillez accepter les conditions d\'utilisation avant de continuer.'),
                          actions: [
                            TextButton(
                                child: Text('D\'accord'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ]));
            }
            break;
          case 3:
            if (storeImageProfil != null) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: Text('Etape 1 validée !'),
                          content: Text(
                              'Parlons maintenant de votre voiture, lorsque vous serez en mode conduction'),
                          actions: [
                            TextButton(
                                child: Text('D\'accord'),
                                onPressed: () {
                                  inscriptionFormSteps.switchNextStep();
                                  Navigator.of(context).pop();
                                }),
                          ]));
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: Text('Photo de profil'),
                          content: Text(
                              'Veuillez choisir une photo de profil avant de continuer.'),
                          actions: [
                            TextButton(
                                child: Text('D\'accord'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ]));
            }
            break;
          case 4:
            if (inscriptionsFormState?.storeImagePermis != null) {
              inscriptionFormSteps.switchNextStep();
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: Text('Fin Build v0.0.1'),
                          content: Text(
                              'Aidez mes créateurs à m\'améliorer, en leurs donnant vos feedbacks ;-)\n\nA très bientôt pour de prochaines mises à jours.'),
                          actions: [
                            TextButton(
                                child: Text('Se connecter'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(
                                      context, '/connexion_form');
                                }),
                          ]));
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: Text('Scanner permis'),
                          content: Text(
                              'Veuillez scanner votre permis avant de continuer.'),
                          actions: [
                            TextButton(
                                child: Text('D\'accord'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ]));
            }
            break;
          default:
            inscriptionFormSteps.switchNextStep();
        }
      }
    });
  }
}
