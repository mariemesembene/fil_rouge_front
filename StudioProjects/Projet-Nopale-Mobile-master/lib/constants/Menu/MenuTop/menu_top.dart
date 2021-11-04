import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/data/models/menu/menuTop/menu_item.dart';

class MenuTopList {

  static List<ItemMenuTop> menuTopList() {
    return [
      ItemMenuTop(
        title: "Abonnement",
        icon: Icons.credit_card,
        iconColor: blueSkyLightColor, 
        bgColor: whiteColor,
        routeName: "/abonnement",
      ),
      ItemMenuTop(
        title: "Transférer",
        icon: Icons.arrow_upward,
        iconColor: pinkColor, 
        bgColor: whiteColor,
        routeName: "/transfert",
      ),
      ItemMenuTop(
        title: "Recharger",
        icon: Icons.arrow_downward,
        iconColor: blueSkyColor, 
        bgColor: whiteColor,
        routeName: "/recharger",
      ),
      ItemMenuTop(
        title: "Transactions",
        icon: Icons.sync_alt,
        iconColor: greenGrayColor, 
        bgColor: whiteColor,
        routeName: "/transactions",
      ),
    ];
  }
}
