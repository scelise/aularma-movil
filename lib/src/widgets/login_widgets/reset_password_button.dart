import 'package:flutter/material.dart';

import '../../pages/reset_password_page.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../../utils/slide_transition.dart';

import '../general_widgets/poppins_text.dart';

class ResetPasswordButton extends StatelessWidget {

  const ResetPasswordButton( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.only( right: ResponsiveApp.dWidth( 24.0 ), bottom: ResponsiveApp.dHeight( 24.0 ) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 12.0 )
              )
            ),
            onPressed: () => Navigator.push( context, SlidePageRoute( page: ResetPasswordPage() ) ),
            child: PoppinsText(
              sText: '¿Olvidaste tu contraseña?', 
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              colorText: ColorsApp.textColor,
              fontWeight: FontWeight.w500
            )
          )
        ]
      )
    );

  }

}