import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';

class SpotifyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget? leading;

  const SpotifyAppBar({Key? key, required this.text, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: AppTheme.fontFamily.regular,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      title: Text(text),
      leading: leading,
      leadingWidth: 48,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
