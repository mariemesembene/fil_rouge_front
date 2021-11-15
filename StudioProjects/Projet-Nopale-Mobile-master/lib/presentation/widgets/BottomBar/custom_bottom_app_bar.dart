import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';

const double size = 30.0;
const defaultColor = iconMenuBottomColor;

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: whiteColor,
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.dashboard,
                size: size,
                color: defaultColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.headset_mic,
                size: size,
                color: defaultColor,

              ),
              onPressed: () {
                navigateToProfil();
              },
            ),
            const SizedBox.shrink(),
            IconButton(
              icon: const Icon(
                Icons.person,
                size: size,
                color: defaultColor,
              ),
              onPressed: () {
                navigateToHelp();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                size: size,
                color: defaultColor,
              ),
              onPressed: () {
                navigateToSettings();
              },
            )
          ],
        ),
      ),
    );
  }
  void navigateToProfil() {
    Navigator.pushNamed(context, '/profil');
  }
  void navigateToSettings() {
    Navigator.pushNamed(context, '/settings');
  }
  void navigateToHelp() {
    Navigator.pushNamed(context, '/help');
  }
}

