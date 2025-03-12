import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/pages/login_page.dart';

import 'src/utils/colors_app.dart';
import 'src/utils/responsive_app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations( [ DeviceOrientation.portraitUp ] );

  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle( statusBarColor: Colors.transparent ) );

  runApp( const MyApp() );

}

class MyApp extends StatefulWidget {

  const MyApp ( { super.key } );

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {

    _configureScreenUtils();
    
    super.didChangeDependencies();

  }

  void _configureScreenUtils() {
    
    ResponsiveApp.init( context, 360, 800 );
    
    if ( ResponsiveApp.bTablet() ) {
      ResponsiveApp.init( context, 900, 1220 );
    }

  }

  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aularma',
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsApp.backgroundColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorsApp.secondaryColor,
          selectionColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
          selectionHandleColor: ColorsApp.primaryColor
        )
      )
    );
  
   }
}