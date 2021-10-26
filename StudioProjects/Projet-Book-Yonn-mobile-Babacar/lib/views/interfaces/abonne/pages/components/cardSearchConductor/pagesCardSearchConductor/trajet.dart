import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/shared/validators/validators.dart';
import 'package:flutter/material.dart';
import 'dart:math';


GlobalKey<FormState> keyFormStep1 = GlobalKey<FormState>();

Validators validators = new Validators();

class Trajet extends StatefulWidget {
  const Trajet({Key? key}) : super(key: key);

  @override
  _TrajetState createState() => _TrajetState();
}

class _TrajetState extends State<Trajet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Title
          Text(
            'Quel est votre trajet ?',
            style: TextStyle(
                color: colorBlue,
                fontSize: 15.0,
                fontFamily: 'SF Pro Display Regular'),
          ),
          // Form
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 18.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: colorBlack, width: 0.4),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                            // Icon
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Icon(
                                  Icons.circle,
                                  color: colorDarkGray,
                                  size: 08.0,
                                ),
                              ),
                              for (var i = 0; i < 6; i++)
                                Icon(Icons.fiber_manual_record,
                                    color: colorLightGray.withOpacity(0.6),
                                    size: 5),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Transform.rotate(
                                  angle: 180 * pi / 180,
                                  child: Icon(
                                    Icons.navigation,
                                    color: colorBlue,
                                    size: 15,
                                  ),
                                ),
                              )
                            ])),
                    Expanded(
                      flex: 6,
                      child: Column(
                        // Input
                        children: [
                          getInputNavigation('Départ'),
                          SizedBox(
                            width: double.infinity,
                            height: 1.0,
                            child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: colorLightGray)),
                          ),
                          getInputNavigation('Destination')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Buttons position and choice in map
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 10),
            child: Column(children: [
              getPoseChoiceMapButton(
                  'Ma position', Icons.my_location_outlined, null),
              SizedBox(
                height: 15.0,
              ),
              getPoseChoiceMapButton(
                  'Choisir sur la map', Icons.explore_outlined, null),
            ]),
          ),
          Visibility(
            visible: false,
            child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(children: [
                  Row(
                    children: [
                      Text('Récente', style: getTextStyleButtonPosChoice()),
                    ],
                  ),
                  Row(
                    children: [
                      getTextRecente('Rufisque'),
                      SizedBox(width: 20.0,),
                      getTextRecente('>'),
                      SizedBox(width: 20.0,),
                      getTextRecente('Grand yoff'),
                    ],
                  ),
                ])),
          ),
        ],
      ),
    );
  }

  Widget getInputNavigation(String label) {
    return TextFormField(
      validator: (value){
      },
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.close,
            size: 12,
            color: colorBlack,
          ),
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 14,
              color: colorLightGray,
              fontFamily: 'SF Pro Display Regular')),
    );
  }

  // Icon(Icons.my_location_outlined, color: colorBlue, size: 16)

  Widget getPoseChoiceMapButton(
      String title, IconData suffixIcon, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            Icon(suffixIcon, color: colorBlue, size: 16),
            SizedBox(width: 5),
            Text(
              title,
              style: getTextStyleButtonPosChoice(),
            )
          ],
        ),
      ),
    );
  }

  TextStyle getTextStyleButtonPosChoice() {
    return TextStyle(
      color: colorBlack,
      fontWeight: FontWeight.w500,
    );
  }

  Text getTextRecente(String title) {
    return Text(title,
        style: TextStyle(
          color: colorLightGray,
          fontSize: 12,
        ));
  }
}
