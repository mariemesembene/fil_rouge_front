import 'package:flutter/material.dart';
import 'package:book_yonn_mobile/views/connexion/components/steps/step1.dart';
import 'package:book_yonn_mobile/views/connexion/components/steps/step2.dart';
import 'package:book_yonn_mobile/views/connexion/components/steps/step3.dart';
import 'package:book_yonn_mobile/views/connexion/components/steps/step4.dart';
import 'package:book_yonn_mobile/views/connexion/components/steps/step5.dart';
class InscriptionFormSteps {
  int _numberStep = 0;

  List<Widget> steps = [
    Step1(),
    Step2(),
    Step3(),
    Step4(),
    Step5(),
  ];

  int getNumberStep() {
    return _numberStep;
  }

  void switchNextStep() {
    if (_numberStep < steps.length - 1) {
      _numberStep++;
    }
  }

  void switchPrevStep() {
    if (_numberStep != 0) {
      _numberStep--;
    }
  }

  Widget getCurrentSteps() {
    return steps[_numberStep];
  }
}
