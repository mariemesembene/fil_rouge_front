import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/helpers/helpers.dart';

class HomeScreenTopBar extends StatefulWidget {
  const HomeScreenTopBar({Key? key}) : super(key: key);

  @override
  _HomeScreenTopBarState createState() => _HomeScreenTopBarState();
}

class _HomeScreenTopBarState extends State<HomeScreenTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: transparentColor,
      leading: const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: whiteColor,
          child: CircleAvatar(
            radius: 16,
            backgroundImage:
                AssetImage('lib/presentation/assets/images/ebs.jpeg'),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Salut Babacar!',
              style: TextStyle(
                  fontSize: 14.0,
                  color: darkGreenColor,
                  fontFamily: 'Circular Std Bold')),
          Row(
            children: const [
              Text(
                '28000',
                style: TextStyle(
                    fontSize: 16.0,
                    color: darkGreenColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Circular Std Bold'),
              ),
              SizedBox(width: 5),
              Icon(Icons.visibility, color: darkGreenColor, size: 18.0),
            ],
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundColor: whiteColor,
            radius: 18,
            child: IconButton(
              icon: const Icon(Icons.notifications_none,
                  color: greenGrayColor, size: 20),
              onPressed: () {},
            ),
          ),
        )
        /* IconButton(
          icon: const Icon(Icons.notifications_none, color: darkGreenColor, size: 20),
          onPressed: () {},
        ), */
      ],
    );
  }
}


/* ClipRRect(
        child: Image.asset('lib/presentation/assets/images/ebs.jpeg'),
        borderRadius: BorderRadius.circular(15),
      ) */
