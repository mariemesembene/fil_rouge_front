import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'app_bar_inscription_stepper.dart';


class AppBarInscription extends StatefulWidget {
  final bool stepperVisibily;
  final int numberStep;

  const AppBarInscription({ Key? key, required this.stepperVisibily, required this.numberStep }) : super(key: key);

  @override
  _AppBarInscriptionState createState() => _AppBarInscriptionState();
}

class _AppBarInscriptionState extends State<AppBarInscription> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: colorWhite,
    title: Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: redirectToBackPage,
              child: Icon(
                  Icons.arrow_back,
                  color: colorBlack,
                ),
            ),
          ),
        ),
        Center(
          child: Text(
              'Inscription',
               style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Circular Std Bold',
              color: colorBlack,
              ),
            ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Visibility(
              child: AppBarInscriptionStepper(numberStep: widget.numberStep),
              visible: widget.stepperVisibily,
              ),
          ),
        ),
      ],
    ),
    );
  }

  void redirectToBackPage() {
    Navigator.pop(context);
  }
}