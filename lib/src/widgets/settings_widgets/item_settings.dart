import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/functions.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';
import 'bottom_sheet_settings.dart';

class ItemSettings extends StatefulWidget {

  final String sText;
  final bool bAlexa;
  final bool bVoice;
  
  const ItemSettings(
    {
      super.key,
      required this.sText,
      this.bAlexa = false,
      this.bVoice = false
    }
  );

  @override
  State<ItemSettings> createState() => _ItemSettingsState();

}

class _ItemSettingsState extends State<ItemSettings> {

  bool bSwitched = false;

  final functions = Functions();

  @override
  Widget build( BuildContext context ) {

    return Container(
      margin: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ) ),
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 8.0 ), vertical: ResponsiveApp.dHeight( 16.0 ) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PoppinsText(
              sText: widget.sText,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              colorText: ColorsApp.textColor
            )
          ),
          SizedBox( height: ResponsiveApp.dWidth( 16.0 ) ),
          widget.bAlexa ? Icon(
            Icons.keyboard_arrow_right_rounded,
            size: ResponsiveApp.dSize( 24.0 ),
            color: ColorsApp.textColor
          ) : Switch(
            value: bSwitched,
            onChanged: ( bSwitch ) {
              if( widget.bVoice && !bSwitched ) {
                functions.showAlertDialog(
                  context,
                  'Permiso de GPS',
                  'Necesitamos acceder a tu ubicación actual',
                  () {
                    Navigator.pop( context );
                    functions.showAlertDialog(
                      context,
                      'Permiso micrófono',
                      'Necesitamos acceso al micrófono de tu celular',
                      (){
                        Navigator.pop( context );
                        functions.showAlertDialog(
                          context,
                          'Permiso acelerómetro',
                          'Necesitamos acceder al sensor de movimiento de tu celular',
                          () {
                            setState(() => bSwitched = true );
                            Navigator.pop( context );
                            functions.showBottomSheet( context, const BottomSheetSettings() );
                          }
                        );
                      }
                    );
                  }
                );
              } else {
                setState(() => bSwitched = bSwitch );
              }
            },
            activeColor: ColorsApp.backgroundColor,
            activeTrackColor: ColorsApp.primaryColor,
            inactiveTrackColor: ColorsApp.inactiveColor,
            inactiveThumbColor: ColorsApp.borderColor,
            trackOutlineColor: WidgetStateProperty.all<Color>( bSwitched ? ColorsApp.primaryColor : ColorsApp.borderColor )
          )
        ]
      )
    );

  }

}

