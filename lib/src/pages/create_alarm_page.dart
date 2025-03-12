import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:provider/provider.dart';

import '../classes/alarm.dart';

import '../providers/alarm_provider.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../utils/slide_transition.dart';
import '../widgets/general_widgets/poppins_text.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import 'repeat_alarm_page.dart';

class CreateAlarmPage extends StatefulWidget {

  const CreateAlarmPage( { super.key } );

  @override
  State<CreateAlarmPage> createState() => _CreateAlarmPageState();

}

class _CreateAlarmPageState extends State<CreateAlarmPage> {

  DateTime? sHour;

  final nameController = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundColor,
        title: PoppinsText(
          sText: 'Crear alarma',
          dFontSize: ResponsiveApp.dSize( 20.0 ),
          colorText: ColorsApp.secondaryColor
        ),
        actions: [
           IconButton(
            onPressed: () {
              alarmProvider.lAlarms.add(
                Alarm(
                  sName: nameController.text,
                  sHour: sHour
                )
              );
              alarmProvider.lAlarms.sort( ( a, b ) => a.sHour!.compareTo( b.sHour! ) );
              alarmProvider.lAlarms = alarmProvider.lAlarms;
              Navigator.pop( context );
            },
            icon: Icon(
              Icons.check_rounded,
              color: ColorsApp.secondaryColor,
              size: ResponsiveApp.dSize( 24.0 )
            )
          )
        ],
        actionsPadding: EdgeInsets.only( right: ResponsiveApp.dWidth( 8.0 ) ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            TimePickerSpinner(
              isForce2Digits: true,
              is24HourMode: false,
              normalTextStyle: GoogleFonts.poppins(
                fontSize: ResponsiveApp.dSize( 16.0 ),
                color: ColorsApp.textColor
              ),
              highlightedTextStyle: GoogleFonts.poppins(
                fontSize: ResponsiveApp.dSize( 22.0 ),
                color: ColorsApp.secondaryColor,
                fontWeight: FontWeight.w500
              ),
              spacing: ResponsiveApp.dWidth( 40.0 ),
              itemWidth: ResponsiveApp.dWidth( 64.0 ),
              itemHeight: ResponsiveApp.dHeight( 48.0 ),
              onTimeChange: ( hour ) => setState( () => sHour = hour )
            ),
            SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
            TextFieldForms(
              controller: nameController,
              sLabel: 'Nombre',
              dWidth: 328.0
            ),
            SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                  child: PoppinsText(
                    sText: 'Repetir',
                    dFontSize: ResponsiveApp.dSize( 14.0 ),
                    colorText: ColorsApp.secondaryColor,
                    fontWeight: FontWeight.w500
                  )
                ),
                TextButton.icon(
                  onPressed: () => Navigator.push( context, SlidePageRoute( page: const RepeatAlarmPage() ) ),
                  style: TextButton.styleFrom(
                    overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular( 12.0 )
                    )
                  ),
                  label: PoppinsText(
                    sText: 'Una vez',
                    dFontSize: ResponsiveApp.dSize( 12.0 ),
                    colorText: ColorsApp.textColor
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: ColorsApp.textColor,
                    size: ResponsiveApp.dSize( 24.0 )
                  ),
                  iconAlignment: IconAlignment.end
                )
              ]
            ),
            SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                  child: PoppinsText(
                    sText: 'Subtareas',
                    dFontSize: ResponsiveApp.dSize( 16.0 ),
                    colorText: ColorsApp.secondaryColor,
                    fontWeight: FontWeight.w500
                  )
                ),
                Padding(
                  padding: EdgeInsets.only( right: ResponsiveApp.dWidth( 12.0 ) ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 12.0 )
                      )
                    ),
                    child: PoppinsText(
                      sText: 'Añadir',
                      dFontSize: ResponsiveApp.dSize( 13.0 ),
                      colorText: ColorsApp.primaryColor,
                      fontWeight: FontWeight.w600
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  
  }

}