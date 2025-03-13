import 'package:flutter/material.dart';

import '../../pages/reset_password_page.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../../utils/slide_transition.dart';

import '../general_widgets/main_button.dart';
import '../general_widgets/poppins_text.dart';
import '../general_widgets/text_field_forms.dart';
import '../general_widgets/title_bottom_sheet.dart';

class BottomSheetResetPassword extends StatefulWidget {

  const BottomSheetResetPassword( { super.key } );

  @override
  State<BottomSheetResetPassword> createState() => _BottomSheetResetPasswordState();

}

class _BottomSheetResetPasswordState extends State<BottomSheetResetPassword> {

  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool bError = false;

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleBottomSheet( sTitle: 'Recuperar contraseña' ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
          PoppinsText(
            sText: 'Enviaremos un código a tu correo electrónico para que puedas cambiar tu contraseña',
            dFontSize: ResponsiveApp.dSize( 13.0 ),
            colorText: ColorsApp.textColor,
            iMaxLines: 4
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 40.0 ) ),
            child: Form(
              key: _formKey,
              child: TextFieldForms(
                sLabel: 'Correo electrónico',
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    setState( () => bError = true );
                    return 'Por favor ingresa un valor';
                  }
                  return null;
                },
                bError: bError
              )
            )
          ),
          MainButton(
            onPressed: () {
              if( _formKey.currentState!.validate() ) {
                Navigator.push( context, SlidePageRoute( page: const ResetPasswordPage() ) );
              }
            },
            sLabel: 'Enviar código'
          ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) )
        ]
      )
    );
  
  }
}