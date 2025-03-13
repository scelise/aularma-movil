import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';

class ItemContactList extends StatelessWidget {

  final String sImage;
  final String sName;

  const ItemContactList(
    {
      super.key,
      required this.sImage,
      required this.sName
    }
  );

  @override
  Widget build( BuildContext context ) {

    return Container(
      margin: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 4.0 ) ),
      padding: EdgeInsets.only( top: ResponsiveApp.dHeight( 8.0 ), bottom: ResponsiveApp.dHeight( 8.0 ), left: ResponsiveApp.dWidth( 8.0 ) ),
      child: Row(
        children: [
          Container(
            height: ResponsiveApp.dSize( 40.0 ),
            width: ResponsiveApp.dSize( 40.0 ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage( sImage ),
                fit: BoxFit.cover
              ),
              shape: BoxShape.circle
            )
          ),
          SizedBox( width: ResponsiveApp.dWidth( 16.0 ) ),
          Expanded(
            child: PoppinsText(
              sText: sName,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              colorText: ColorsApp.textColor
            )
          ),
          SizedBox( width: ResponsiveApp.dWidth( 24.0 ) ),
          IconButton(
            onPressed: (){},
            icon: Icon( Icons.phone, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) )
          ),
          IconButton(
            onPressed: (){},
            icon: Icon( Icons.mail_rounded, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) )
          )
        ]
      )
    );

  }

}