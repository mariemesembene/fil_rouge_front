import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Cards/CategoriesCards/categories_cards.dart';

class ListCategoriesCard {
  // get default card categorie
  static getDefaultCard() {
    return const CategoriesCard(
      icon: Icons.help_outline,
      iconColor: orangeDarkColor,
      bgColor: orangeMediumColor,
      category: TransactionCategories.autre,
    );
  }

  // get all card categories
  static List<CategoriesCard> getListCard() {
    return [
      const CategoriesCard(
        icon: Icons.fastfood,
        iconColor: greenIconColor,
        bgColor: greenBgIconColor,
        category: TransactionCategories.alimentation,
      ),
      const CategoriesCard(
        icon: Icons.directions_bus_filled,
        iconColor: yellowIconColor,
        bgColor: yellowBgIconColor,
        category: TransactionCategories.transport,
      ),
      const CategoriesCard(
        icon: Icons.shopping_basket,
        iconColor: darkBlueIconColor,
        bgColor: blueBgIconColor,
        category: TransactionCategories.shopping,
      ),
      const CategoriesCard(
        icon: Icons.fitness_center,
        iconColor: mauveIconColor,
        bgColor: mauveBgColor,
        category: TransactionCategories.sport,
      ),
      const CategoriesCard(
        icon: Icons.favorite,
        iconColor: pinkIconColor,
        bgColor: pinkBgColor,
        category: TransactionCategories.assurance,
      ),
      const CategoriesCard(
        icon: Icons.arrow_upward,
        iconColor: pinkIconColor,
        bgColor: pinkBgColor,
        category: TransactionCategories.transferer,
      ),
      const CategoriesCard(
        icon: Icons.arrow_downward,
        iconColor: pinkIconColor,
        bgColor: pinkBgColor,
        category: TransactionCategories.recharger,
      ),
    ];
  }
}
