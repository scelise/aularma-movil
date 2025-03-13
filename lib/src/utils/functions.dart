import 'package:flutter/material.dart';

import '../pages/splash_page.dart';

import '../widgets/general_widgets/poppins_text.dart';

import 'circular_transition.dart';
import 'colors_app.dart';
import 'responsive_app.dart';

class Functions {

  showBottomSheet( BuildContext context, Widget child) {

    return showModalBottomSheet(
      context: context,
      builder: ( context ) => AnimatedPadding(
        duration: const Duration( milliseconds: 300 ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular( 28.0 ),
          topRight: Radius.circular( 28.0 )
        )
      ),
      backgroundColor: ColorsApp.backgroundColor,
      isScrollControlled: true
    );

  }

  showAlertDialog( BuildContext context, String sTitle, String sContent ) {

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsApp.backgroundColor,
        title: PoppinsText(
          sText: sTitle,
          dFontSize: ResponsiveApp.dSize( 24.0 ),
          colorText: ColorsApp.secondaryColor
        ),
        content: PoppinsText(
          sText: sContent,
          dFontSize: ResponsiveApp.dSize( 14.0 ),
          colorText: ColorsApp.textColor,
          iMaxLines: 3
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              CircularTransition( page: const SplashPage() ),
              ( route ) => false
            ),
            style: TextButton.styleFrom(
              overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 12.0 )
              )
            ),
            child: PoppinsText(
              sText: 'Aceptar',
              dFontSize: ResponsiveApp.dSize( 13.0 ),
              colorText: ColorsApp.primaryColor,
              fontWeight: FontWeight.w600
            )
          )
        ]
      )
    );

  }

}