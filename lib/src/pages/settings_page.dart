import 'package:flutter/material.dart';

import '../utils/responsive_app.dart';
import '../widgets/settings_widgets/item_settings.dart';

class SettingsPage extends StatelessWidget {
  
  const SettingsPage( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return Column(
      children: [
        SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
        const ItemSettings(
          sText: 'Alarma de ruta escolar'
        ),
        const ItemSettings(
          sText: 'Alarma de clima'
        ),
        const ItemSettings(
          sText: 'Volumen alto en el exterior'
        ),
        const ItemSettings(
          sText: 'Comandos de voz en movimiento',
          bVoice: true
        ),
        const ItemSettings(
          sText: 'Integrar con Alexa',
          bAlexa: true
        )
      ]
    );

  }

}