import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/functions.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';
import '../reset_password_widgets/bottom_sheet_reset_password.dart';

class ResetPasswordButton extends StatelessWidget {

  ResetPasswordButton( { super.key } );

  final functions = Functions();

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
            onPressed: () => functions.showBottomSheet( context, const BottomSheetResetPassword() ) ,
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