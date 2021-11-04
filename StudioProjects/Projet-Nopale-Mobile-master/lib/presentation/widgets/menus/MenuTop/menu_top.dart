import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/Menu/MenuTop/menu_top.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';

class MenuTop extends StatefulWidget {
  const MenuTop({Key? key}) : super(key: key);

  @override
  _MenuTopState createState() => _MenuTopState();
}

class _MenuTopState extends State<MenuTop> {
  @override
  Widget build(BuildContext context) {
    final menuTopList = MenuTopList.menuTopList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildMenuItems(menuTopList),
    );
  }
}

// function to build the menu items
List<Widget> _buildMenuItems(menuTopList) {
  return menuTopList.map<Widget>((menuItem) {
    return Column(
      children: [
        buttonMenuTopItem(menuItem),
        const SizedBox(
          height: 10.0,
        ),
        titleMenuTopItem(menuItem),
      ],
    );
  }).toList();
}

// function to build the button menu item
GestureDetector buttonMenuTopItem(menuItem) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 53.0,
      height: 51.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Icon(
        menuItem.icon,
        color: menuItem.iconColor,
        size: 25.0,
      ),
    ),
  );
}

// function to build the title menu item
Text titleMenuTopItem(menuItem) {
  return Text(
    menuItem.title,
    style: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Display Regular',
      color: darkGreenColor,
    ),
  );
}
