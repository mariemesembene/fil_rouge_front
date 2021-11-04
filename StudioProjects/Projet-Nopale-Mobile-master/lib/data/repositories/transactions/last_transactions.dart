import 'package:projet_nopale_mobile/data/models/transactions/transactions.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Cards/CategoriesCards/categories_cards.dart';

class LastTransactionsList {

  static List<Transactions> allTransactionsList() {
    return [
      Transactions(
        id: 1,
        title: 'Paiement resto ucad',
        type: TypeTransactions.abonnement,
        categorie: TransactionCategories.alimentation,
        date: DateTime.now(),
        montant: 100,
      ),
      Transactions(
        id: 2,
        title: 'Rechargement par cash',
        type: TypeTransactions.recharge,
        categorie: TransactionCategories.recharger,
        date: DateTime.now(),
        montant: 2500,
      ),
      Transactions(
        id: 3,
        title: 'Abonnement Gymico',
        type: TypeTransactions.abonnement,
        categorie: TransactionCategories.sport,
        date: DateTime.now(),
        montant: 100,
      ),
    ];
  }
}
