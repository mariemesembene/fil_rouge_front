import 'package:book_yonn_mobile/views/inscriptions/interfaces/abonne/components/bottomNavbarAbonne/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';

ItemsNavBarAbonne? itemsNavBarAbonne;

class ItemsNavBarAbonne extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isClicked = false;

  ItemsNavBarAbonne() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ItemsNavBarAbonne createState() => itemsNavBarAbonne = ItemsNavBarAbonne();

  List<BottomNavyBarItem> get itemsAbonne => [
        BottomNavyBarItem(
          icon: Icon(Icons.place_outlined),
          title: 'Navigation',
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.date_range_outlined),
          title: 'Mes réservations',
        ),
        BottomNavyBarItem(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
          title: 'Plus d\'options',
          isMoreItem: true,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person_outline),
          title: 'Mon profil',
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.notifications_outlined),
          title: 'Notifications',
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings_outlined),
          title: 'Paramètres',
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.share_outlined),
          title: 'Partage positions',
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.help_outline),
          title: 'Aide',
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search_outlined),
          title: 'Rechercher',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
  }

  void toggleIcons() {
      isClicked = !isClicked;
      isClicked ? _controller.forward() : _controller.reverse();
  }
}