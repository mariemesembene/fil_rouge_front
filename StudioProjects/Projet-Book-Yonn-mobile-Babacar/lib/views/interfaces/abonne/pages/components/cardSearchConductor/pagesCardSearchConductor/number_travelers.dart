import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class NumberTravelers extends StatefulWidget {
  const NumberTravelers({Key? key}) : super(key: key);

  @override
  _NumberTravelersState createState() => _NumberTravelersState();
}

class _NumberTravelersState extends State<NumberTravelers> {
  int _numberOfTravelers = 5; // based on loop
  Color defautNumberColor = colorBlack;
  Color defautCircleColor = Colors.transparent;
  late int _indexNumberTaped = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Vous comptez voyager avec\ncombien de personnes ?',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5,
                color: colorBlue,
                fontSize: 15.0,
                fontFamily: 'SF Pro Display Regular'),
          ),
          SizedBox(height: 60.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [for (int i = 0; i < _numberOfTravelers; i++) getNumberOfTravelers(i)],
            ),
          ),
        ],
      ),
    );
  }

  Widget getNumberOfTravelers(int index) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: _indexNumberTaped != index ? Colors.transparent : colorBlue,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _indexNumberTaped = index;
          });
        },
        child: Text(
          index.toString(),
          style: TextStyle(
              color: _indexNumberTaped != index ? colorBlack : colorWhite,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Circular Std Bold'),
        ),
      ),
    );
  }
}
