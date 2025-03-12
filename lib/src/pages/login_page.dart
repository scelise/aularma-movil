import 'package:flutter/material.dart';

import '../utils/responsive_app.dart';

import '../widgets/login_widgets/login_header.dart';
import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import '../widgets/login_widgets/create_account_button.dart';
import '../widgets/login_widgets/reset_password_button.dart';

class LoginPage extends StatelessWidget {

  LoginPage( { super.key } );

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(),
            SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
            TextFieldForms(
              controller: controllerEmail,
              sLabel: 'Correo electrónico'
            ),
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            TextFieldForms(
              controller: controllerPassword,
              sLabel: 'Contraseña',
              bIsPassword: true
            ),
            SizedBox( height: ResponsiveApp.dHeight( 8.0 ) ),
            const ResetPasswordButton(),
            MainButton(
              sLabel: 'Iniciar sesión',
              onPressed: () {},
            ),
            SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
            const CreateAccountButton()
          ]
        )
      )
    );

  }

}