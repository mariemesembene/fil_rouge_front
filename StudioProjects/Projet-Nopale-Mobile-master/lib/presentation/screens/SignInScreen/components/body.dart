import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignInScreen/components/sign_in_form.dart';
import 'package:projet_nopale_mobile/presentation/widgets/NoAccountText/no_account_text.dart';
import 'package:projet_nopale_mobile/presentation/widgets/ParagraphTitlePageText/paragraph_title_page.dart';
import 'package:projet_nopale_mobile/presentation/widgets/TitlePageText/title_page_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                /*Image.asset(
                  'lib/presentation/assets/images/logo/logo1.jpeg',
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(100),
                ),*/
                const TitlePageText(text: 'Nopalé'),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                const ParagraphTitlePage(
                    text:
                        "Connectez-vous avec votre numéro de téléphone et mot de passe"),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
