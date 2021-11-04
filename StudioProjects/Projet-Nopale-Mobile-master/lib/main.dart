import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/Localizations/localizations.dart';
import 'package:projet_nopale_mobile/presentation/Theme/theme.dart';
import 'package:projet_nopale_mobile/constants/routers/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet_nopale_mobile/presentation/screens/HelpScreen/help_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/settings/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: getLocalizations,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: theme(),
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: _appRouter.onGenerateRoute,
         home:  settingsScreen(),
    );
  }
}
