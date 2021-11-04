import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/Cards/CategoriesCard/categories_card.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/data/repositories/transactions/last_transactions.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Transactions/TransactionsListBuilder/transactions_list_builder.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastTransactionsList = LastTransactionsList.allTransactionsList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: greenColor),
        ),
        title: const Text(
          'Toutes les transactions',
          style: TextStyle(
              color: darkGreenColor, fontFamily: 'SF Pro Display Regular'),
        ),
        backgroundColor: lightGrayColor,
      ),
      body: Center(
        child: Column(
          children: [
            searchInput(),
            // categoriesTransactionsList(),
            Column(
              children: buildLastTransactions(lastTransactionsList),
            )
          ],
        ),
      ),
    );
  }

  Padding searchInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Rechercher',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'SF Pro Display Regular',
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: textFieldGrayColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  categoriesTransactionsList() {
    final allCategoriesTransactions = ListCategoriesCard.getListCard();
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: allCategoriesTransactions,
      ),
    );
  }
}

/* Text(
          'Changement en cours',
          style: TextStyle(
            color: blackColor,
            fontSize: 24.0,
          ),
        ) */
