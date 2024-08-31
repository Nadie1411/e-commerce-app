import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts
{
 static TextTheme appFont = TextTheme(
    bodySmall: GoogleFonts.poppins(fontSize: 18 , fontWeight: FontWeight.w300, color: AppColors.whiteColor) ,
    bodyMedium:GoogleFonts.poppins(fontSize: 24 , fontWeight: FontWeight.w600,color: AppColors.whiteColor) ,
    bodyLarge:GoogleFonts.poppins(fontSize: 30 , fontWeight: FontWeight.bold,color: AppColors.whiteColor)


  );
}