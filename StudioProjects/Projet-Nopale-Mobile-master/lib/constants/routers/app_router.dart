import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/presentation/screens/DashboardScreen/dashboard_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/ForgetPasswordScreen/forget_password_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/HelpScreen/help_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/HomeScreen/home_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/ProfilScreen/components/profil_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignInScreen/sign_in_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignUpScreen/sign_up_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/SplashScreen/splashscreen.dart';
import 'package:projet_nopale_mobile/presentation/screens/otp/otp_screen.dart';
import 'package:projet_nopale_mobile/presentation/screens/settings/settings_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/forget_password':
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/otp':
        return MaterialPageRoute(builder: (_) => OtpScreen());
        case '/help':
        return MaterialPageRoute(builder: (_) =>  HelpScreen());
      case '/profil':
        return MaterialPageRoute(builder: (_) =>  profilScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) =>  settingsScreen());
      default:

        return null;
    }
  }
}
