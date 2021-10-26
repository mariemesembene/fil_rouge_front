import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/modal/list_colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/modal/modal_color_car.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/steps/step5.dart';
import 'package:flutter/material.dart';

_BrainColorCarState? brainColorCarState;

class BrainColorCar extends StatefulWidget {

  const BrainColorCar({Key? key}) : super(key: key);

  @override
  _BrainColorCarState createState() => brainColorCarState = _BrainColorCarState();
}

class _BrainColorCarState extends State<BrainColorCar> {
  int colorChooseIndex = step5state!.indexColorChoosed;

  List<Row> listRows = [];
  generatePaletteCarColor() {
    int indexColor = 0;
    for (var i = 0; i < getNumberRows(); i++) {
      List<Widget> listColors = [];
      for (var j = indexColor;
          j < indexColor + 6 && j < getNumberColors();
          j++) {
        listColors.add(Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              chooseColor(j);
            },
            child: CircleAvatar(
              radius: colorChooseIndex == j ? 19 : 17,
              backgroundColor:
                  colorChooseIndex == j ? colorBlue : colorMediumGray,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: getColor(j),
              ),
            ),
          ),
        ));
      }
      listRows.add(new Row(
        children: listColors,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ));
      indexColor += 6;
    }
    return listRows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: generatePaletteCarColor(),
    );
  }

  Color getColor(index) {
    return carColors[index];
  }

  int getNumberColors() {
    return carColors.length;
  }

  int getNumberRows() {
    return getNumberColors() ~/ 6;
  }

  chooseColor(index) {
    setState(() {
      listRows = [];
      colorChooseIndex = index;
      modalColorCarState?.setState(() {
         modalColorCarState?.selectedColorIndex = index;
      });
    });
  }
}
