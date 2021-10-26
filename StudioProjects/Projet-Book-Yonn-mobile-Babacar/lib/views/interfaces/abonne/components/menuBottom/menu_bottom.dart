import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom(
      {Key? key, required this.selectedIndex, required this.onTaped})
      : super(key: key);

  final int selectedIndex;
  final onTaped;

  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme:  iconBottomItemsStyle(30, colorBlue),
    unselectedIconTheme: iconBottomItemsStyle(30, colorDarkGray),
      items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.place_outlined), label: 'Navigation'),
      BottomNavigationBarItem(
          icon: Icon(Icons.date_range_outlined), label: 'Réservations'),
      BottomNavigationBarItem(
          icon: Icon(Icons.folder_open_outlined), label: 'Historique'),
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined), label: 'Notifications')
    ], currentIndex: widget.selectedIndex, onTap: widget.onTaped);
  }
  iconBottomItemsStyle(double size, Color color) {
   return IconThemeData(
     color: color,
     size: size,
   );
 }
}
