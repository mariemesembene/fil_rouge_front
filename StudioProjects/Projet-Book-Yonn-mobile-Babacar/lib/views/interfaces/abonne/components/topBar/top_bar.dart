import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_form.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: colorBlue,
            radius: 18,
            child: CircleAvatar(
              radius: 16,
              backgroundImage: inscriptionsFormState?.storeImageProfil != null
                  ? FileImage(inscriptionsFormState!.storeImageProfil!)
                  : null,
            ),
          ),
        ),
        title: Container(
            alignment: Alignment.center,
            child: Image(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                image: AssetImage(
                  'assets/images/lo.png',
                ))),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: colorDarkGray,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.info_outlined,
                color: colorRed,
              ),
              onPressed: null)
        ]);
  }
}
