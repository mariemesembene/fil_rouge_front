import 'package:book_yonn_mobile/views/inscriptions/interfaces/abonne/components/bottomNavbarAbonne/buildBottomNavBar.dart';
import 'package:flutter/material.dart';

_AbonneMainState? abonneMainState;

class AbonneMain extends StatefulWidget {
  const AbonneMain({Key? key}) : super(key: key);

  @override
  _AbonneMainState createState() => abonneMainState = _AbonneMainState();
}

class _AbonneMainState extends State<AbonneMain> {
  int currentIndexFirst = 0;
  int currentIndexSecond = 0;

  // pages of first row bottom navbar
  final List<Widget> _pageFirst = [
    Center(child: Text('Page navigation')),
    Center(child: Text('Page réservations')),
    Center(child: Text('Page more')),
    Center(child: Text('Page profil')),
    Center(child: Text('Page notifications'))
  ];

  // pages of second row bottom navbar
  final List<Widget> _pageSecond = [
    Center(child: Text('Page paramètre')),
    Center(child: Text('Page partage positions')),
    Center(child: Text('Page aide')),
    Center(child: Text('Page rechercher'))
  ];

  set currentPageIndex(currentPageIndex) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Container(
          color: Colors.red,
          width: double.infinity,
          child: currentIndexFirst != 0
              ? _pageFirst[currentIndexFirst]
              : (currentIndexSecond != 0
                  ? _pageSecond[currentIndexSecond]
                  : _pageFirst[0]),
        ),
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: BuildBottomNavbar(),
        ),
      ),
    );
  }
}
