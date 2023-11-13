extension StringExtension on String {
  String replaceInitialAndFinalBrackets() {
    return replaceAll('[', '').replaceAll(']', '');
  }

  String formatFollowers() {
    int followers = int.tryParse(this) ?? 0;

    if (followers < 1000) {
      return followers.toString();
    } else if (followers < 1000000) {
      double kFollowers = followers / 1000.0;
      String formattedFollowers = '${kFollowers.truncate()}k';
      return kFollowers.truncateToDouble() == kFollowers
          ? formattedFollowers
          : formattedFollowers.replaceFirst('.0', '');
    } else {
      double mFollowers = followers / 1000000.0;
      String formattedFollowers = '${mFollowers.truncate()}M';
      return mFollowers.truncateToDouble() == mFollowers
          ? formattedFollowers
          : formattedFollowers.replaceFirst('.0', '');
    }
  }
}
