import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../providers/alarm_provider.dart';

import '../utils/responsive_app.dart';

import '../widgets/alarm_widgets/alarm_card.dart';
import '../widgets/general_widgets/empty_state.dart';

class AlarmsPage extends StatefulWidget {

  const AlarmsPage( { super.key } );

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();

}

class _AlarmsPageState extends State<AlarmsPage> {

  String formatDate( DateTime date ) {

    String formattedTime = DateFormat('hh:mm a', 'es_ES').format( date );

    return formattedTime.replaceAll('AM', 'a. m.').replaceAll('PM', 'p. m.');

  }

  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );

    return  alarmProvider.lAlarms.isEmpty ? const EmptyState() : ListView.builder(
      padding: EdgeInsets.only( top: ResponsiveApp.dHeight( 16.0 ) ),
      itemCount: alarmProvider.lAlarms.length,
      itemBuilder: ( context, index ) => AlarmCard(
        sName: alarmProvider.lAlarms[index].sName!,
        sHour: formatDate( alarmProvider.lAlarms[index].sHour! )
      )
    );

  }

}