import 'package:spotiflutter/src/features/playlist/data/dto/playlist_track_item.dto.dart';

class PlaylistTrackDto {
  final String? href;
  final num? limit;
  final String? next;
  final num? offset;
  final String? previous;
  final num? total;
  final List<PlaylistTrackItemDto>? items;

  PlaylistTrackDto({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory PlaylistTrackDto.fromJson(Map<String, dynamic> json) {
    return PlaylistTrackDto(
      href: json['href'],
      limit: json['limit'],
      next: json['next'],
      offset: json['offset'],
      previous: json['previous'],
      total: json['total'],
      items: json['items'] == null
          ? []
          : List<PlaylistTrackItemDto>.from(
              json['items']!.map((x) => PlaylistTrackItemDto.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        'href': href,
        'limit': limit,
        'next': next,
        'offset': offset,
        'previous': previous,
        'total': total,
        'items': items?.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return '$href, $limit, $next, $offset, $previous, $total';
  }
}
