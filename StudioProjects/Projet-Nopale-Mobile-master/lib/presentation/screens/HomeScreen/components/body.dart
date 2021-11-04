import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/Animations/Duration/duration.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/presentation/screens/HomeScreen/components/content.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Buttons/DefaultButton/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Votre Wallet qui vous suit partout",
      "image": "lib/presentation/assets/images/Home/home1.png"
    },
    {
      "text":
          "Faites vos transactions avec vos proches où que vous soyez",
      "image": "lib/presentation/assets/images/Home/home2.png"
    },
    {
      "text": "Dundu cii Banekh",
      "image": "lib/presentation/assets/images/Home/home3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => Content(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      color: greenColor,
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: HomeImageTabDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? greenColor : homeTabColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
