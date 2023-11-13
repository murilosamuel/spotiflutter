import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';

class HomePageIcon extends StatelessWidget {
  final IconData icon;
  final int currentPage;
  final int page;
  final VoidCallback? onTap;

  const HomePageIcon({
    Key? key,
    required this.icon,
    required this.currentPage,
    required this.page,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 28,
        color: currentPage == page ? AppTheme.colors.primary : null,
      ),
    );
  }
}
