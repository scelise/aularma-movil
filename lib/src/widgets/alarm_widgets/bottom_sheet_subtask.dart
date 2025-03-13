import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/alarm_provider.dart';

import '../../utils/responsive_app.dart';

import '../general_widgets/main_button.dart';
import '../general_widgets/text_field_forms.dart';
import '../general_widgets/title_bottom_sheet.dart';

// ignore: must_be_immutable
class BottomSheetSubtask extends StatefulWidget {

  const BottomSheetSubtask( { super.key } );

  @override
  State<BottomSheetSubtask> createState() => _BottomSheetSubtaskState();

}

class _BottomSheetSubtaskState extends State<BottomSheetSubtask> {
  
  final descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool bError = false;
  
  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TitleBottomSheet( sTitle: 'Crear subtarea' ),
            SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
            TextFieldForms(
              sLabel: 'Descripción',
              controller: descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  setState( () => bError = true );
                  return 'Por favor ingresa un valor';
                }
                return null;
              },
              bError: bError
            ),
            Padding(
              padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 32.0 ) ),
              child: MainButton(
                onPressed: () {
        
                  if( _formKey.currentState!.validate() ) {
                    alarmProvider.lSubtask.add( descriptionController.text );
                    alarmProvider.lSubtask = alarmProvider.lSubtask;
                    Navigator.pop( context );
                  }
        
                },
                sLabel: 'Guardar'
              )
            )
          ]
        )
      )
    );

  }
}