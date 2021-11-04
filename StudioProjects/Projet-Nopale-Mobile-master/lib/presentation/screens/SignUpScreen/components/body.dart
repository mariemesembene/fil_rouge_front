import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignUpScreen/components/sign_up_step_1.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignUpScreen/components/sign_up_step_2.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Buttons/DefaultButton/default_button.dart';
import 'package:projet_nopale_mobile/presentation/widgets/ParagraphTitlePageText/paragraph_title_page.dart';
import 'package:projet_nopale_mobile/presentation/widgets/TitlePageText/title_page_text.dart';

_BodyState? bodyState;

List<Widget> steps = [
  const SignUpStep1(),
  const SignUpStep2(),
];

List<GlobalKey<FormState>> formKeys = [
  keyFormStep1,
  keyFormStep2,
];

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => bodyState = _BodyState();
}

class _BodyState extends State<Body> {
  int _numberStep = 0;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: createAllCircle(),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const TitlePageText(text: 'Créer compte Nopalé'),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                const ParagraphTitlePage(
                    text: "Créer votre en remplissant les champs ci-dessous"),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                getCurrentSteps(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: DefaultButton(
                        color: orangeMediumColor,
                        text: 'Précédent',
                        press: switchPrevStep,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: DefaultButton(
                        color: greenMediumColor,
                        text: _numberStep < steps.length - 1
                            ? 'Suivant'
                            : 'Terminer',
                        press: switchNextStep,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int getNumberStep() {
    return _numberStep;
  }

  void switchNextStep() {
    if (formKeys[_numberStep].currentState!.validate() == true) {
      if (_numberStep < steps.length - 1) {
        setState(() {
          _numberStep++;
        });
      } else {
        Navigator.pushNamed(context, '/otp');
      }
    }
  }

  void switchPrevStep() {
    if (_numberStep != 0) {
      setState(() {
        _numberStep--;
      });
    }
  }

  Widget getCurrentSteps() {
    return steps[_numberStep];
  }

  createOneCircle(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: orangeMediumColor, width: 0.25),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CircleAvatar(
          backgroundColor:
              index <= _numberStep ? orangeMediumColor : grayColor,
          radius: 06.0,
        ),
      ),
    );
  }

  createAllCircle() {
    final children = <Widget>[];
    for (var i = 0; i < steps.length; i++) {
      children.add(createOneCircle(i));
    }
    return children;
  }
}
