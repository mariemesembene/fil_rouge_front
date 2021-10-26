import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({Key? key}) : super(key: key);

  @override
  _PaymentModeState createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  int _selectedPaymentMode = 0;

  @override
  Widget build(BuildContext context) {
    List<Map> paymentsModes = [
      {'name': 'Orange Money', 'image': 'logo-om.png'},
      {'name': 'Free Money', 'image': 'logo-free.png'},
      {'name': 'YUP', 'image': 'logo-yup.jpeg'},
      {'name': 'En espèce', 'image': 'paiement-en-especes.png'},
    ];

    return Container(
      child: Column(
        children: [
          Text(
            'Quel(s) mode(s) de paiement\nacceptez-vous ?',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5,
                color: colorBlue,
                fontSize: 15.0,
                fontFamily: 'SF Pro Display Regular'),
          ),
          SizedBox(height: 50.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                // Payment mode
                for (int i = 0; i < paymentsModes.length; i++)
                  getPaymentMode(
                      paymentsModes[i]['name'], paymentsModes[i]['image'], i),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getPaymentMode(String title, String logoName, int id) {
  return GestureDetector(
    onTap: (){
      setState(() {
        _selectedPaymentMode = id;
      });
    },
    child: Row(
      children: [
        Image(
          image: AssetImage('assets/images/payments/' + logoName),
          width: 40,
          height: 40,
        ),
        SizedBox(width: 20.0),
        Text(
          title,
          style: TextStyle(
            color: _selectedPaymentMode == id ? colorBlue : colorLightGray,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ],
    ),
  );
}
}

