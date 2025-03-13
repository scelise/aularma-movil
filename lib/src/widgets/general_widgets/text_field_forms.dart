import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import 'poppins_text.dart';

class TextFieldForms extends StatefulWidget {

  final TextEditingController controller;
  final bool bIsPassword;
  final bool bEnabled;
  final String sLabel;
  final double dWidth;

  const TextFieldForms(
    {
      super.key,
      required this.controller,
      required this.sLabel,
      this.dWidth = 312.0,
      this.bIsPassword = false,
      this.bEnabled = true
    }
  );

  @override
  State<TextFieldForms> createState() => _TextFieldFormsState();
}

class _TextFieldFormsState extends State<TextFieldForms> {

  bool bObscure = true;

  @override
  Widget build( BuildContext context ) {

    return SizedBox(
      width: ResponsiveApp.dWidth( widget.dWidth ),
      child: TextFormField(
        enabled: widget.bEnabled,
        controller: widget.controller,
        obscureText: widget.bIsPassword ? bObscure : false,
        style: GoogleFonts.poppins(
          color: ColorsApp.secondaryColor,
          fontSize: ResponsiveApp.dSize( 14.0 )
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ), vertical: ResponsiveApp.dHeight( 18.0 ) ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( 8.0 ),
            borderSide: const BorderSide( color: ColorsApp.borderColor)
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( 8.0 ),
            borderSide: const BorderSide( color: ColorsApp.borderColor)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( 8.0 ),
            borderSide: const BorderSide( color: ColorsApp.secondaryColor, width: 3.0 )
          ),
          label: PoppinsText(
            sText: widget.sLabel,
            dFontSize: ResponsiveApp.dSize( 13.0 ),
            colorText: ColorsApp.textColor
          ),
          suffixIcon: widget.bIsPassword ? IconButton(
            onPressed: () => setState(() => bObscure = !bObscure ),
            icon: Icon(
              bObscure ? Icons.visibility_off : Icons.visibility,
              color: ColorsApp.primaryColor
            )
          ) : const SizedBox()
        )
      )
    );

  }
}