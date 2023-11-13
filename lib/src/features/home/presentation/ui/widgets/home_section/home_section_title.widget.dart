import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';

class HomeSectionTitle extends StatelessWidget {
  final String text;

  const HomeSectionTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTheme.fontFamily.bold,
          fontSize: 18,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
