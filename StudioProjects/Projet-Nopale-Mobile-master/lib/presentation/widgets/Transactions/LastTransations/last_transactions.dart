import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:projet_nopale_mobile/constants/Cards/CategoriesCard/categories_card.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/data/models/transactions/transactions.dart';
import 'package:projet_nopale_mobile/data/repositories/transactions/last_transactions.dart';
import 'package:projet_nopale_mobile/presentation/screens/Transactions/AllTransactions/all_transactions.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Cards/CategoriesCards/categories_cards.dart';
import 'package:projet_nopale_mobile/presentation/widgets/CustomPageBuilder/custom_page_route_builder.dart';

class LastTransactions extends StatefulWidget {
  const LastTransactions({Key? key}) : super(key: key);

  @override
  _LastTransactionsState createState() => _LastTransactionsState();
}

class _LastTransactionsState extends State<LastTransactions> {
  @override
  Widget build(BuildContext context) {
    final lastTransactionsList =
    LastTransactionsList.allTransactionsList(); //Last list transactions
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        decoration: const BoxDecoration(
          color: lightGrayColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
        ),
        width: double.infinity,
        height: 310,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRouteBuilder(
                      widget: const AllTransactions(),
                    ),
                  );
                },
                child: iconSwip()),
            titleCard(),
            dataCard(lastTransactionsList),
          ],
        ),
      ),
    );
  }

  // data card zone
  Expanded dataCard(lastTransactionsList) {
    return Expanded(
      flex: 5,
      child: SingleChildScrollView(
        child: Column(
          children: _buildLastTransactions(lastTransactionsList),
        ),
      ),
    );
  }

  // title card zone
  Expanded titleCard() {
    return const Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 0, 0, 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dernières transactions',
              style: TextStyle(
                  fontSize: 18.0,
                  color: darkGreenColor,
                  fontFamily: 'Circular Std Bold',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  // icon swip zone
  Expanded iconSwip() {
    return const Expanded(
      flex: 1,
      child: Icon(Icons.arrow_drop_up, size: 55.0, color: grayColor),
    );
  }

  openAllTransactionspage(context) {
    Navigator.push(
      context,
      CustomPageRouteBuilder(
        widget: const AllTransactions(),
      ),
    );
  }

  // build transactions list
  List<Widget> _buildLastTransactions(lastTransactionsList) {
    return lastTransactionsList.map<Widget>((Transactions transaction) {
      return SingleChildScrollView(
        child: Column(
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
        ),
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

  TextStyle titleStyle() {
    return const TextStyle(
      fontFamily: 'SF Pro Display Regular',
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: darkGreenColor,
    );
  }

  TextStyle dateStyle() {
    return const TextStyle(
      fontFamily: 'SF Pro Display Regular',
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle amountStyle() {
    return const TextStyle();
  }

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
}