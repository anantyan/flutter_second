
import 'package:flutter/material.dart';
import 'package:flutter_second/utils/size.dart';
import 'package:google_fonts/google_fonts.dart';

const Color cPurpleColor = Color(0xff5041FF);
const Color cYellowColor = Color(0xffFFB41C);
const Color cDarkWhiteColor = Color(0xffEBEDF1);
const Color cLightWhiteColor = Color(0xff434F65);
const Color cBlackColor = Color(0xff172B4D);

final cTitleOnBoarding = GoogleFonts.inter(
  fontSize: SizeConfig.blockSizeHorizontal! * 4,
  color: cBlackColor,
  fontWeight: FontWeight.bold
);

final cSubtitleOnBoarding = GoogleFonts.inter(
    fontSize: SizeConfig.blockSizeHorizontal! * 2,
    color: cLightWhiteColor
);

final cTextButton = GoogleFonts.inter(
  color: cPurpleColor,
  fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
  fontWeight: FontWeight.bold
);
