import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/form/custom_text_form_field.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/modal/list_colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/modal/modal_color_car.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_form.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

_Step5State? step5state;

GlobalKey<FormState> keyFormStep5 = GlobalKey<FormState>();

class Step5 extends StatefulWidget {
  const Step5({Key? key}) : super(key: key);

  @override
  _Step5State createState() => step5state = _Step5State();
}

class _Step5State extends State<Step5> {

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      if (imageFile != null) {
        inscriptionsFormState?.setState(() {
          inscriptionsFormState?.storeImagePermis = File(imageFile.path);
        });
      }
    });
  }

  int indexColorChoosed = 0;
  final FocusNode numPermisFocus = FocusNode();
  final FocusNode numSerieVoitureFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyFormStep5,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Numéro de permis',
            suffixIcon: Icon(Icons.info_outline),
            controller: inscriptionsFormState!.numeroPermisController,
            focusNode: numPermisFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(numSerieVoitureFocus);
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Veuillez saisir le num. de permis';
              }
            },
            type: TextInputType.text,
          ),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.5),
              child: GestureDetector(
                onTap: _takePicture,
                child: Row(
                  children: [
                    Icon(
                      Icons.document_scanner_outlined,
                      size: 30,
                      color: colorBlue,
                    ),
                    SizedBox(
                      width: 14.7,
                    ),
                    Text(
                      'Scanner mon permis',
                      style: TextStyle(
                          color: colorBlue,
                          fontFamily: 'Circular Std Bold',
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomTextFormField(
              label: 'Numéro de serie de la voiture',
              suffixIcon: Icon(Icons.info_outline),
              focusNode: numSerieVoitureFocus,
              controller: inscriptionsFormState!.numeroSerieVoiture,
              type: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez saisir le num. de serie';
                }
              }),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.5),
              child: GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (_) => ModalColorCar());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(
                        Icons.palette_outlined,
                        size: 30,
                        color: colorBlue,
                      ),
                      SizedBox(
                        width: 14.7,
                      ),
                      Text(
                        'Ma couleur de voiture',
                        style: TextStyle(
                            color: colorBlue,
                            fontFamily: 'Circular Std Bold',
                            fontSize: 18),
                      ),
                    ]),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: colorMediumGray,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: carColors[indexColorChoosed],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: inscriptionsFormState?.storeImagePermis != null,
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: colorBlue),
              ),
              width: 300,
              height: 100,
              child: inscriptionsFormState!.storeImagePermis != null
                  ? Image.file(
                      inscriptionsFormState!.storeImagePermis!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
