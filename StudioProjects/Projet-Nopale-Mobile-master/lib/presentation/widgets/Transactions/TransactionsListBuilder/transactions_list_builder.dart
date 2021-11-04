import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projet_nopale_mobile/constants/Cards/CategoriesCard/categories_card.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/data/models/transactions/transactions.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Cards/CategoriesCards/categories_cards.dart';
import 'package:intl/date_symbol_data_local.dart';

List<Widget> buildLastTransactions(lastTransactionsList) {
    return lastTransactionsList.map<Widget>((Transactions transaction) {
      return Column(
        children: [Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                getCategoryCardByTransfert(transaction.categorieTransactions),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction.title, style: titleStyle()),
                    const SizedBox(height: 2.0),
                    Text(
                      dateTransactionFormater(transaction.date),
                      style: dateStyle(),
                    )
                  ],
                )
              ],
            ),
            Text(
              '${getTransactionAmountSymbol(transaction.typeTransactions)} ${transaction.montant}',
              style: titleStyle(),
            )
          ]),
        ), const SizedBox(height: 20.0)],
      );
    }).toList();
  }

  /// function to get the category card by the transaction category
  CategoriesCard getCategoryCardByTransfert(
      TransactionCategories transfertCategory) {
    final listCategoriesCard = ListCategoriesCard.getListCard();
    for (var categoryCard in listCategoriesCard) {
      if (categoryCard.categoryTransaction == transfertCategory) {
        return categoryCard;
      }
    }
    return ListCategoriesCard.getDefaultCard();
  }

  // title transaction style
  TextStyle titleStyle() {
    return const TextStyle(
      fontFamily: 'SF Pro Display Regular',
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: darkGreenColor,
    );
  }

  // date transaction style
  TextStyle dateStyle() {
    return const TextStyle(
      fontFamily: 'SF Pro Display Regular',
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    );
  }

  // amount transaction style
  TextStyle amountStyle() {
    return const TextStyle();
  }

  // date transaction formater
  String dateTransactionFormater(DateTime date) {
    initializeDateFormatting();
    return DateFormat('d MMMM y, H:m', 'FR').format(date);
  }

  String getTransactionAmountSymbol(TypeTransactions transactionType) {
    if (transactionType == TypeTransactions.transfert ||
        transactionType == TypeTransactions.abonnement) {
      return '-';
    } else {
      return '+';
    }
  }