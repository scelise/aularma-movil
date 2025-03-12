import 'package:flutter/material.dart';

import '../../pages/create_account_page.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../../utils/slide_transition.dart';

import '../general_widgets/poppins_text.dart';

class CreateAccountButton extends StatelessWidget {

  const CreateAccountButton( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 12.0 )
              )
            ),
            onPressed: () => Navigator.push( context, SlidePageRoute( page:  CreateAccountPage() ) ),
            child: PoppinsText(
              sText: 'Crea una cuenta', 
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