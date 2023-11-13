import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpotifyTextFieldTheme {
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final bool isDense;
  final ThemeMode? themeMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final bool readOnly;
  final TextStyle? labelTextStyle;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;

  SpotifyTextFieldTheme({
    this.prefix,
    this.suffix,
    this.hintText,
    this.isDense = true,
    this.themeMode = ThemeMode.light,
    this.inputFormatters,
    this.style,
    this.obscureText = false,
    this.textAlign,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.readOnly = false,
    this.labelTextStyle,
    this.keyboardType,
    this.contentPadding,
  });
}
