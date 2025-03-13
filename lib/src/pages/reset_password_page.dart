import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/responsive_app.dart';
import '../utils/slide_transition.dart';

import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import '../widgets/reset_password_widgets/reset_password_header.dart';

import 'login_page.dart';

class ResetPasswordPage extends StatelessWidget {

  ResetPasswordPage( { super.key } );

  final controllerCode = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ResetPasswordHeader(),
              SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
              TextFieldForms(
                controller: controllerCode,
                sLabel: 'Código de seguridad'
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
                sLabel: 'Restablecer contraseña',
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  SlidePageRoute( page: LoginPage() ),
                  (route) => false
                )
              )
            ]
          )
        )
      )
    );

  }

}