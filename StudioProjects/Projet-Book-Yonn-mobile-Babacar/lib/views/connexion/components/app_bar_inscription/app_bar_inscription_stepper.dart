import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';



class AppBarInscriptionStepper extends StatefulWidget {

  final int numberStep;

  const AppBarInscriptionStepper({ Key? key, required this.numberStep }) : super(key: key);

  @override
  _AppBarInscriptionStepperState createState() => _AppBarInscriptionStepperState();
}

class _AppBarInscriptionStepperState extends State<AppBarInscriptionStepper> {

  final formStepsNumber = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: createAllCircle(),
    );
  }

  createOneCircle(int index){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorMediumGray, width: 0.25),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CircleAvatar(
            backgroundColor: index <= widget.numberStep ? colorBlue : Colors.transparent,
            radius: 06.0,
       ),
      ),
    );
  }

  createAllCircle(){
    final children = <Widget>[];
    for (var i = 0; i < formStepsNumber; i++) {
      children.add(createOneCircle(i));
    }
    return children;
  }

}