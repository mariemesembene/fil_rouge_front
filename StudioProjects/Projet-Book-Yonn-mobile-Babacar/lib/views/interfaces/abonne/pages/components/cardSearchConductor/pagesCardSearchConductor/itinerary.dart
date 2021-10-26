import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Itinerary extends StatefulWidget {
  const Itinerary({Key? key}) : super(key: key);

  @override
  _ItineraryState createState() => _ItineraryState();
}

class _ItineraryState extends State<Itinerary> {
  List<String> _itinerary = ['Nationale', '  Péage  '];
  int _indexButtonClicked = 0;
  Color _defautTextColor = colorBlack;
  Color _selectedTextColor = colorWhite;
  Color _defautBackgroundColor = Colors.transparent;
  Color _selectedBackgroundColor = colorBlack;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text(
          'Quel itineraire préférez-vous ?',
          textAlign: TextAlign.center,
          style: TextStyle(
              height: 1.5,
              color: colorBlue,
              fontSize: 15.0,
              fontFamily: 'SF Pro Display Regular'),
        ),
        SizedBox(height: 80.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          for (var i = 0; i < _itinerary.length; i++)
            getButtonItinerary(_itinerary[i], i),
        ]),
      ]),
    );
  }

  Widget getButtonItinerary(String text, int id) {
    return OutlinedButton(
        onPressed: (){
          setState(() {
            _indexButtonClicked = id;
          });
        },
        child: Text(
          text,
          style: TextStyle(color: _indexButtonClicked == id ? colorWhite : colorBlack),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: _indexButtonClicked == id ? colorBlack : Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          side: BorderSide(width: 2.0, color: colorBlack),
        ));
  }

  // reset buttons itinerary colors
  void resetColorButton() {
    setState(() {
      _defautTextColor = colorBlack;
      _defautBackgroundColor = Colors.transparent;
    });
  }

  VoidCallback? getOnPressed(String text) {
    if (text == 'Nationale') {}
  }
}


/* CustomRadioButton(
            elevation: 0.0,
            buttonValues: ['nationale', 'peage'],
            buttonLables: ['Nationale', 'Péages'],
            unSelectedBorderColor: colorBlack,
            buttonTextStyle: ButtonTextStyle(
                selectedColor: Colors.white,
                unSelectedColor: Colors.black,
                textStyle: TextStyle(fontSize: 14)),
            radioButtonValue: (value) {
              print(value);
            },
            selectedColor: colorBlue,
            unSelectedColor: Colors.transparent) */