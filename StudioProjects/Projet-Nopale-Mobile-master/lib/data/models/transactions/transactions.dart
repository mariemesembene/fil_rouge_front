import 'package:projet_nopale_mobile/presentation/widgets/Cards/CategoriesCards/categories_cards.dart';

enum TypeTransactions { abonnement, transfert, recharge }

class Transactions {
  int id;
  String title;
  TypeTransactions type;
  DateTime date;
  int montant;
  TransactionCategories categorie;

  Transactions(
      {required this.title,
      required this.categorie,
      required this.id,
      required this.type,
      required this.date,
      required this.montant});
  TypeTransactions get typeTransactions => type;
  TransactionCategories get categorieTransactions => categorie;
}
