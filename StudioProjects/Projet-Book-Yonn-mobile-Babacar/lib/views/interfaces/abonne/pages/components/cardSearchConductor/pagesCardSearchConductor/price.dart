import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  RangeValues _currentRangeValues = RangeValues(1000, 9000);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text(
          'Veuillez donner votre\nplage de prix',
          textAlign: TextAlign.center,
          style: TextStyle(
              height: 1.5,
              color: colorBlue,
              fontSize: 15.0,
              fontFamily: 'SF Pro Display Regular'),
        ),
        SizedBox(height: 50.0),
        Container(
          child: RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 10000,
            divisions: 50,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
        ),
        SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showRangeValues(_currentRangeValues.start.round()),
              showRangeValues(_currentRangeValues.end.round()),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fcfa',
              style: TextStyle(color: colorBlueDark.withOpacity(0.6)),
            )
          ],
        )
      ]),
    );
  }

  Text showRangeValues(int value) {
    return Text(value.toString(),
        style: TextStyle(color: colorBlack, fontSize: 16));
  }
}
