import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final String abbreviation;
  final bool selected;
  final VoidCallback? onTap;

  const LanguageButton({
    Key? key,
    required this.language,
    required this.abbreviation,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: selected ? AppTheme.colors.primary : Colors.transparent,
          border: Border.all(
            color: selected ? AppTheme.colors.primary : Colors.white,
            width: selected ? 0 : 2,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/svg/$abbreviation.svg',
              width: MediaQuery.sizeOf(context).width * 0.05,
            ),
            const SizedBox(width: 10),
            Text(
              language,
              style: TextStyle(
                fontFamily: AppTheme.fontFamily.bold,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? AppTheme.colors.black : Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
