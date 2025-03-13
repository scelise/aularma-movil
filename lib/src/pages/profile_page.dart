import 'package:flutter/material.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../widgets/profile_widgets/item_info.dart';
import '../widgets/general_widgets/poppins_text.dart';
import '../widgets/profile_widgets/button_logout.dart';

class ProfilePage extends StatelessWidget {
  
  const ProfilePage( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundColor
      ),
      body: Column(
        children: [
          SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
          Container(
            height: ResponsiveApp.dHeight( 120.0 ),
            width: ResponsiveApp.dHeight( 120.0 ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage( 'assets/images/profile.jpg' ),
                fit: BoxFit.cover
              )
            )
          ),
          SizedBox( height: ResponsiveApp.dHeight( 24.0 ) ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
            child: PoppinsText(
              sText: 'Sergio Augusto Celis Esteban',
              dFontSize: ResponsiveApp.dSize( 24.0 ),
              colorText: ColorsApp.secondaryColor,
              iMaxLines: 3,
              textAlign: TextAlign.center
            )
          ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
          const ItemInfo(
            icon: Icons.email_rounded,
            sText: 'sergio.celis@aularma.com'
          ),
          const ItemInfo(
            icon: Icons.phone_rounded,
            sText: '321 578 2190'
          ),
          const ItemInfo(
            icon: Icons.location_on_rounded,
            sText: 'Calle 11 # 7-24 Málaga, Santander'
          ),
          const Expanded( child: SizedBox() ),
          const ButtonLogout()
        ]
      )
    );

  }

}