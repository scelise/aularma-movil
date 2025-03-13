import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/alarm_provider.dart';
import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';
import '../utils/slide_transition.dart';

import '../widgets/general_widgets/poppins_text.dart';

import 'alarms_page.dart';
import 'contacts_page.dart';
import 'settings_page.dart';
import 'create_alarm_page.dart';

class MainPage extends StatefulWidget {

  const MainPage( { super.key } );

  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  int iIndexNavigation = 0;

  List<Widget> lPages = [ const AlarmsPage(), const ContactsPage(), const SettingsPage() ];

  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle_rounded,
            color: ColorsApp.secondaryColor,
            size: ResponsiveApp.dSize( 24.0 )
          )
        ),
        title: PoppinsText(
          sText: iIndexNavigation == 0 ? 'Alarmas' : iIndexNavigation == 1 ? 'Contactos' : 'Configuración',
          dFontSize: ResponsiveApp.dSize( 20.0 ),
          colorText: ColorsApp.secondaryColor
        ),
        actions: [
           iIndexNavigation == 0 ? IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: ColorsApp.secondaryColor,
              size: ResponsiveApp.dSize( 24.0 )
            )
          ) : const SizedBox()
        ],
        actionsPadding: EdgeInsets.only( right: ResponsiveApp.dWidth( 8.0 ) ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState( () => iIndexNavigation = index );
        },
        backgroundColor: ColorsApp.backgroundColor,
        selectedIndex: iIndexNavigation,
        indicatorColor: ColorsApp.secondaryColor,
        labelTextStyle: WidgetStateProperty.all<TextStyle>(
          GoogleFonts.poppins(
            fontSize: ResponsiveApp.dSize( 12.0 ),
            color: ColorsApp.textColor,
            fontWeight: FontWeight.w500
          )
        ),
        destinations: [
          NavigationDestination(
            selectedIcon: Icon( Icons.notifications_none_rounded, color: ColorsApp.secondaryTextColor, size: ResponsiveApp.dSize( 24.0 ) ),
            icon: Icon( Icons.notifications_none_rounded, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) ),
            label: 'Alarmas'
          ),
          NavigationDestination(
            selectedIcon: Icon( Icons.person_rounded, color: ColorsApp.secondaryTextColor, size: ResponsiveApp.dSize( 24.0 ) ),
            icon: Icon( Icons.person_rounded, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) ),
            label: 'Contactos'
          ),
          NavigationDestination(
            selectedIcon: Icon( Icons.settings_rounded, color: ColorsApp.secondaryTextColor, size: ResponsiveApp.dSize( 24.0 ) ),
            icon: Icon( Icons.settings_rounded, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) ),
            label: 'Configuración'
          )
        ]
      ),
      body: lPages.elementAt( iIndexNavigation ),
      floatingActionButton: iIndexNavigation == 0 ? FloatingActionButton(
        onPressed: () {
          alarmProvider.lSubtask.clear();
          Navigator.push( context, SlidePageRoute( page: const CreateAlarmPage() ) );
        },
        backgroundColor: ColorsApp.backgroundColor,
        child: Icon( Icons.add_rounded, color: ColorsApp.primaryColor, size: ResponsiveApp.dSize( 24.0 ) )
      ) : const SizedBox()
    );
  
  }

}