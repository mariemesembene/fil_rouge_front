
import 'package:book_yonn_mobile/views/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Demarrage extends StatefulWidget {
  const Demarrage({Key? key}) : super(key: key);
  @override
  _DemarrageState createState() => _DemarrageState();
}

class _DemarrageState extends State<Demarrage> {
  @override
  void initState(){
    super.initState();
    _navigatehome();
  }
  _navigatehome()async{
    await Future.delayed(Duration(milliseconds: 3000),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>OnboardingScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Image(
                image: AssetImage(
                  'assets/images/lo.png',
                ),
                height: 280.0,
                width: 280.0,
                
              ),
            ),
             const Text(
                'Bokk Yoon',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey
                ),
                      )
          ],
        ),
      ),

    );
  }
}