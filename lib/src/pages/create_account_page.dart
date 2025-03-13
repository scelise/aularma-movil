import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/functions.dart';
import '../utils/responsive_app.dart';

import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import '../widgets/create_account_widgets/bottom_sheet_address.dart';
import '../widgets/create_account_widgets/create_account_header.dart';

class CreateAccountPage extends StatelessWidget {

  CreateAccountPage( { super.key } );

  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerAdress = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  final functions = Functions();

  @override
  Widget build( BuildContext context ) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
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
              GestureDetector(
                child: TextFieldForms(
                  controller: controllerAdress,
                  sLabel: 'Dirección',
                  bEnabled: false
                ),
                onTap: () => functions.showBottomSheet( context, BottomSheetAddress() ),
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
                onPressed: () => functions.showAlertDialog(
                  context,
                  '¡Perfecto!',
                  'Tu cuenta ha sido creada con éxito'
                )
              )
            ]
          )
        )
      )
    );

  }

}