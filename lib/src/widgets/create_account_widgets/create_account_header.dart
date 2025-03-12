import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';
import '../general_widgets/background_image.dart';
import '../general_widgets/main_back_button.dart';

class CreateAccountHeader extends StatelessWidget {
  
  const CreateAccountHeader( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return BackgroundImage(
      height: 236.0,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 8.0 ), bottom: ResponsiveApp.dHeight( 40.0 ) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const MainBackButton(),
              SizedBox( height: ResponsiveApp.dHeight( 56.0 ) ),
              Padding(
                padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                child: PoppinsText(
                  sText: 'Crea tu cuenta',
                  dFontSize: ResponsiveApp.dSize( 32.0 ),
                  colorText: ColorsApp.secondaryTextColor
                )
              )
            ]
          )
        )
      )
    );

  }

}