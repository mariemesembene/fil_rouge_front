import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/interfaces/abonne/abonne_main.dart';
import 'package:book_yonn_mobile/views/inscriptions/interfaces/abonne/components/bottomNavbarAbonne/custom_animated_bottom_bar.dart';
import 'package:book_yonn_mobile/views/inscriptions/interfaces/abonne/components/bottomNavbarAbonne/items_navbar_abonne.dart';
import 'package:flutter/material.dart';
import 'dart:async';

final ItemsNavBarAbonne itemsNavBarAbonne = new ItemsNavBarAbonne();

class BuildBottomNavbar extends StatefulWidget {
  const BuildBottomNavbar({Key? key}) : super(key: key);

  @override
  _BuildBottomNavbarState createState() => _BuildBottomNavbarState();
}

class _BuildBottomNavbarState extends State<BuildBottomNavbar> {
  int _currentIndex = 0;
  double _containerHeight = 78;
  bool addMoreSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedBottomBar(
      containerHeight: _containerHeight,
      backgroundColor: colorWhite,
      selectedIndex: _currentIndex,
      onItemSelected: onItemSelected,
      items: itemsNavBarAbonne.itemsAbonne,
    );
  }

  onItemSelected(index) {
    setState(() {
      _currentIndex = index;
      if (index == 2) {
        itemsNavBarAbonne.toggleIcons();

        if (!addMoreSelected) {
          addMoreSelected = true;
          _containerHeight = 150;
          Timer(Duration(milliseconds: 250), () {
            customAnimatedBottomBarState?.setState(() {
              customAnimatedBottomBarState?.addMoreItemsSelected = true;
            });
          });
        } else {
          addMoreSelected = false;
          customAnimatedBottomBarState?.setState(() {
              customAnimatedBottomBarState?.addMoreItemsSelected = false;
            });
          _containerHeight = 78;
        }
      }else{
        abonneMainState?.setState(() {
          abonneMainState!.currentPageIndex = index;
        });
      }
    });
  }
}