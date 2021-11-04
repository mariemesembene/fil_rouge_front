import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/presentation/widgets/BottomBar/custom_bottom_app_bar.dart';
import 'package:projet_nopale_mobile/presentation/widgets/CarteNopale/carte_nopale.dart';
import 'package:projet_nopale_mobile/presentation/widgets/HomeAppBar/home_screen_top_bar.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Transactions/LastTransations/last_transactions.dart';
import 'package:projet_nopale_mobile/presentation/widgets/menus/MenuTop/menu_top.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const PreferredSize(
          child: HomeScreenTopBar(), preferredSize: Size.fromHeight(45)),
      backgroundColor: greenBackgroundColor,
      body: Column(
        children: const [
          CarteNopale(),
          MenuTop(),
          LastTransactions(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: iconMenuBottomColor,
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30,)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
