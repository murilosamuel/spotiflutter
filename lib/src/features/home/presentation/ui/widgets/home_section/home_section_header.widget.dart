import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';
import 'package:spotiflutter/src/features/preferences/presentation/ui/pages/preferences.page.dart';

class HomeSectionHeader extends StatelessWidget {
  final String text;

  const HomeSectionHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: AppTheme.fontFamily.bold,
                fontSize: 24,
              ),
            ),
          ),
          const Icon(
            Icons.notifications_none,
            size: 30,
          ),
          const SizedBox(width: 20),
          const Icon(
            Icons.history,
            size: 30,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PreferencesPage.routeName);
            },
            child: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
