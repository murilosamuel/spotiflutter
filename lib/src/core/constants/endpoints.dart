import 'package:spotiflutter/flavors.dart';

class EndPointConstants {
  EndPointConstants._();

  static final EndPointConstants instance = EndPointConstants._();

  String get apiEndpoint => F.apiBase;

  String get tokenEndpoint => F.tokenApiBase;

  String get token => '$tokenEndpoint/token';

  String get search => '$apiEndpoint/search';

  String get playlists => '$apiEndpoint/playlists';

  String get albums => '$apiEndpoint/albums';

  String get tracks => '$apiEndpoint/tracks';

  String get artists => '$apiEndpoint/artists/';

  String get browseCategories => '$apiEndpoint/browse/categories';
}
