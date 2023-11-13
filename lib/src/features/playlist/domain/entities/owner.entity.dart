import 'package:spotiflutter/src/features/common/domain/entities/external_urls.entity.dart';
import 'package:spotiflutter/src/features/common/domain/entities/followers.entity.dart';

class Owner {
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final String? href;
  final String? id;
  final String? type;
  final String? uri;
  final String? displayName;
  final String? name;

  Owner({
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.displayName,
    this.name,
  });

  @override
  String toString() {
    return '$displayName - $name - $followers';
  }
}
