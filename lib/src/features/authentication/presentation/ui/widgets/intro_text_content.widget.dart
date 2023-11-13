import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';

class IntroTextContent extends StatelessWidget {
  const IntroTextContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Millions of songs.',
          style: _titleStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          'Free on Spotify.',
          style: _titleStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  TextStyle get _titleStyle => TextStyle(
        fontFamily: AppTheme.fontFamily.bold,
        fontSize: 30,
      );
}
