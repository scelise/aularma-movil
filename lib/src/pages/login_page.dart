import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/circular_transition.dart';
import '../utils/responsive_app.dart';

import '../widgets/login_widgets/login_header.dart';
import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import '../widgets/login_widgets/create_account_button.dart';
import '../widgets/login_widgets/reset_password_button.dart';

import 'splash_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage( { super.key } );

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final controllerEmail = TextEditingController();

  final controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool bEmailError = false;
  bool bPassError = false;

  @override
  Widget build( BuildContext context ) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const LoginHeader(),
                SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
                TextFieldForms(
                  controller: controllerEmail,
                  sLabel: 'Correo electrónico',
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState( () => bEmailError = true );
                      return 'Por favor ingresa un valor';
                    }
                    return null;
                  },
                  bError: bEmailError
                ),
                SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
                TextFieldForms(
                  controller: controllerPassword,
                  sLabel: 'Contraseña',
                  bIsPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState( () => bPassError = true );
                      return 'Por favor ingresa un valor';
                    }
                    return null;
                  },
                  bError: bPassError
                ),
                SizedBox( height: ResponsiveApp.dHeight( 8.0 ) ),
                ResetPasswordButton(),
                MainButton(
                  sLabel: 'Iniciar sesión',
                  onPressed: () {
                    if( _formKey.currentState!.validate() ) {
                      Navigator.pushReplacement(
                        context,
                        CircularTransition( page: const SplashPage() )
                      );
                    }
                  }
                ),
                SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
                const CreateAccountButton()
              ]
            )
          )
        )
      )
    );

  }
}