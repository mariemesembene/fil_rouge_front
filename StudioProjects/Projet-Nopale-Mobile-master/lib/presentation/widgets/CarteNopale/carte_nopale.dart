import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/presentation/screens/Transactions/AllTransactions/all_transactions.dart';
import 'package:projet_nopale_mobile/presentation/widgets/CustomPageBuilder/custom_page_route_builder.dart';

class CarteNopale extends StatefulWidget {
  const CarteNopale({Key? key}) : super(key: key);

  @override
  _CarteNopaleState createState() => _CarteNopaleState();
}

class _CarteNopaleState extends State<CarteNopale> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, CustomPageRouteBuilder(widget: const AllTransactions()));
      },
      child: Stack(children: <Widget>[
        Image.asset(
          'lib/presentation/assets/images/card/carte_nopale_recto.png',
          height: 250,
        ),
      ]),
    );
  }
}
