import 'package:flutter/material.dart';

//Colors
const primaryColor = Color(0xFF1A1968);

const buttonPrimaryBackgroundColor = Color(0xFF1A1968);
const buttonPrimaryTextColor = Colors.white;

const textGray = Color(0xFF777777);
const textBlack = Color(0xFF3B3636);
const textWhite = Color(0xFFFFFFFF);

const inputBorderColor = Color(0xFFE8E8E8);
const inputPlaceholderColor = Color(0xFFBEBEC2);
const inputBackgroundColor = Color(0xFFF2F2F7);

//Measures
const backgroundPadding = 24.0;

const mainCardRadius = 8.0;
const mainCardPaddingVertical = 12.0;
const mainCardPaddingHorizontal = 24.0;

const statusMessageOpacity = 0.2;
const statusMessagePadding = 12.0;

const buttonRadius = 8.0;
const buttonPaddingVertical = 14.0;
const buttonPaddingHorizontal = 18.0;

final merchantPortalTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
);
