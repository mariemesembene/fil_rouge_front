import 'package:flutter/cupertino.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/helpers/helpers.dart';

class Bodyp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Nous Contacter",
                style: headingStyle,
              ),

              SizedBox(height: SizeConfig.screenHeight * 0.08),

            Row(
                children: [
                  Container(
                    width: 100,
                    height: 75,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/presentation/assets/images/logo/logotel.png'),
                      ),
                    ),
                  ),
                 const  Text("Contactez-nous au Téléphone",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
          ]
      ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),

              Row(
                  children: [
                    Container(
                      width: 80,
                      height: 60,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/presentation/assets/images/logo/logoinstagram.png'),
                        ),
                      ),
                    ),
                    const  Text("Contactez-nous sur Instagram",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                  ]
              ),

              SizedBox(height: SizeConfig.screenHeight * 0.07),

              Row(
                  children: [
                    Container(
                      width: 80,
                      height: 65,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/presentation/assets/images/logo/logofacebook.png'),
                        ),
                      ),
                    ),
                    const  Text("Contactez-nous sur Facebook",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
                  ]
              ),

              SizedBox(height: SizeConfig.screenHeight * 0.09),

              Row(
                  children: [
                    Container(
                      width: 90,
                      height: 85,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/presentation/assets/images/logo/logowatsapp.png'),
                        ),
                      ),
                    ),
                    const  Text("Contactez-nous sur WatsApp",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                  ]
              ),


            ],
          ),
        ),
      ),
    );
  }


}