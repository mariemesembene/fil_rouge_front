import 'package:book_yonn_mobile/views/connexion/connexion_home.dart';
import 'package:book_yonn_mobile/views/demarrage/demarrage.dart';
import 'package:book_yonn_mobile/views/connexion/connexion.form.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_home.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_form.dart';
import 'package:book_yonn_mobile/views/interfaces/abonne/pages/abonne_center.dart';
import 'package:book_yonn_mobile/views/interfaces/abonne/pages/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/demarrage',
        routes: {
          '/abonne_center': (context) => AbonneCenter(),
          '/inscription_home': (context) => InscriptionHome(),
          '/inscription_form': (context) => InscriptionsForm(),
          '/connexion_form': (context) => ConnexionsForm(),
          '/connexion_home': (context) => ConnexionsHome(),
          '/demarrage': (context) => Demarrage(),
          '/map': (context) => MapScreen(),
        },
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ]
        );
  }
}
