import 'package:flutter/material.dart';

import '../utils/responsive_app.dart';
import '../widgets/create_account_widgets/create_account_header.dart';
import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';

class CreateAccountPage extends StatelessWidget {

  CreateAccountPage( { super.key } );

  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerAdress = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CreateAccountHeader(),
            SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
            TextFieldForms(
              controller: controllerName,
              sLabel: 'Nombre'
            ),
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            TextFieldForms(
              controller: controllerEmail,
              sLabel: 'Correo electrónico'
            ),
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            TextFieldForms(
              controller: controllerAdress,
              sLabel: 'Dirección'
            ),
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            TextFieldForms(
              controller: controllerPassword,
              sLabel: 'Contraseña',
              bIsPassword: true
            ),
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            TextFieldForms(
              controller: controllerConfirmPassword,
              sLabel: 'Confirmar contraseña',
              bIsPassword: true
            ),
            SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
            MainButton(
              sLabel: 'Crear cuenta',
              onPressed: (){}
            )
          ]
        )
      )
    );

  }

}