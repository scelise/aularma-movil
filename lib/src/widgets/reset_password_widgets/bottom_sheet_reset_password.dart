import 'package:flutter/material.dart';

import '../../pages/reset_password_page.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../../utils/slide_transition.dart';

import '../general_widgets/main_button.dart';
import '../general_widgets/poppins_text.dart';
import '../general_widgets/text_field_forms.dart';
import '../general_widgets/title_bottom_sheet.dart';

class BottomSheetResetPassword extends StatelessWidget {

  BottomSheetResetPassword( { super.key } );

  final emailController = TextEditingController();

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
            child: TextFieldForms(
              sLabel: 'Correo electrónico',
              controller: emailController
            )
          ),
          MainButton(
            onPressed: () => Navigator.push( context, SlidePageRoute( page: ResetPasswordPage() ) ),
            sLabel: 'Enviar código'
          ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) )
        ]
      )
    );
  
  }

}