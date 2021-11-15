import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';


class Bodyprofil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35.0,
              ),
              const CircleAvatar(
                radius: 50,
                // backgroundColor: Colors.amber,
                child: CircleAvatar(
                    radius: 500,
                    // child: Image.asset("assets/images/nophotoMale.png")
                    backgroundImage:
                        AssetImage('lib/presentation/assets/images/me.png')),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Ndèye Marième Sembéne Diop",
                style: TextStyle( fontWeight: FontWeight.bold, fontFamily: 'Circular Std Bold', fontSize: 16),
              ),
              const SizedBox(
                height: 90.0,
              ),
          Row(
            children: [
              Icon(Icons.arrow_left    , color: Colors.orange, size: 28.0),
              TextButton(
                onPressed: () {
                  _openPopups(context);
                },
                child: const Text('Modifier Mot de passe',style: TextStyle(  fontSize: 16.0,
                  color: darkGreenColor,),),
              ),

            ],),

              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Icon(Icons.arrow_left    , color: Colors.orange, size: 28.0),
                TextButton(
                  onPressed: () {
                    _openPopup(context);
                  },
                  child: const Text('Modifier Email',style: TextStyle(  fontSize: 16.0,
                    color: darkGreenColor,),),
                ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
_openPopup(context) { showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Changer Email'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ancien ',
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nouveau',
                    icon: Icon(Icons.email),
                  ),
                ),

              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                // your code
              }

              )
        ],
      );
    });
}
_openPopups(context) { showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Modifier Mot de passe'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ancien ',
                    icon: Icon(Icons.password),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nouveau ',
                    icon: Icon(Icons.password),
                  ),
                ),

              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                // your code
              }

          )
        ],
      );
    });
}



