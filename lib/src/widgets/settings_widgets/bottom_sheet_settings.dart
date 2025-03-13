import 'package:flutter/material.dart';

import '../../utils/responsive_app.dart';
import '../general_widgets/main_button.dart';
import '../general_widgets/text_field_forms.dart';
import '../general_widgets/title_bottom_sheet.dart';

class BottomSheetSettings extends StatefulWidget {

  const BottomSheetSettings( { super.key } );

  @override
  State<BottomSheetSettings> createState() => _BottomSheetSettingsState();

}

class _BottomSheetSettingsState extends State<BottomSheetSettings> {

  final offController = TextEditingController();
  final suspendController = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleBottomSheet( sTitle: 'Recuperar contraseña' ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
          TextFieldForms(
            sLabel: 'Comando para apagar',
            controller: offController
          ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
          TextFieldForms(
            sLabel: 'Comando para apagar',
            controller: suspendController
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 32.0 ) ),
            child: MainButton(
              sLabel: 'Guardar',
              onPressed: () => Navigator.pop( context )
            )
          )
        ]
      )
    );

  }

}