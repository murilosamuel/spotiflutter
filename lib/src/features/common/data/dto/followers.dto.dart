class FollowersDto {
  final String? href;
  final num? total;

  FollowersDto({
    this.href,
    this.total,
  });

  factory FollowersDto.fromJson(Map<String, dynamic> json) {
    return FollowersDto(
      href: json['href'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
    'href': href,
    'total': total,
  };

  @override
  String toString() {
    return '$href - $total';
  }
}