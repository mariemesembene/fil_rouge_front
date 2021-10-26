import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/interfaces/abonne/pages/components/shared/buttonText/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'card_search_conductor_steps.dart';

CardSearchConductorSteps cardSearchConductorSteps =
    new CardSearchConductorSteps();

class CardSearchConductor extends StatefulWidget {
  final bool isVisible;

  const CardSearchConductor({Key? key, this.isVisible = false})
      : super(key: key);

  @override
  _CardSearchConductorState createState() => _CardSearchConductorState();
}

class _CardSearchConductorState extends State<CardSearchConductor> {

  final departController = TextEditingController();
  final arriveController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
              width: 300,
              height: 425,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: colorWhite.withOpacity(0.9),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: colorGray.withOpacity(0.8))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Recherche Conducteur',
                                style: TextStyle(
                                    color: colorDarkGray,
                                    fontSize: 18,
                                    fontFamily: 'Circular Std Bold',
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 23.0, horizontal: 2.0),
                                child: Icon(Icons.circle,
                                    size: 7.0, color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 1),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: cardSearchConductorSteps.getCurrentStepConductor(),
                    ),
                    flex: 7,
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Visibility(
                              visible: cardSearchConductorSteps
                                          .getNumberStepConductor() !=
                                      0
                                  ? true
                                  : false,
                              child: ButtonText(
                                text: 'Précédent',
                                color: colorBlack,
                                onPressed: prevStep,
                              ),
                            ),
                            Visibility(
                              visible: cardSearchConductorSteps
                                          .getNumberStepConductor() !=
                                      cardSearchConductorSteps
                                          .getLastIndexOfStepConductor()
                                  ? true
                                  : false,
                              child: ButtonText(
                                  text: 'Suivant',
                                  color: colorBlue,
                                  onPressed: nextStep),
                            )
                          ],
                        ),
                      ),
                      flex: 1),
                ],
              )),
        ),
      ),
    );
  }

  void nextStep() {
    setState(() {
      cardSearchConductorSteps.switchNextStepConductor();
    });
  }

  void prevStep() {
    setState(() {
      cardSearchConductorSteps.switchPreviewStepConductor();
    });
  }

  bool getStatutVisible(condition) {
    return condition != 0 ? true : false;
  }
}
