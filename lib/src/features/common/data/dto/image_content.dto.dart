class ImageContentDto {
  final String? url;
  final num? height;
  final int? width;

  ImageContentDto({
    this.url,
    this.height,
    this.width,
  });

  factory ImageContentDto.fromJson(Map<dynamic, dynamic> json) {
    return ImageContentDto(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'height': height,
    'width': width,
  };

  @override
  String toString() {
    return url ?? '';
  }
}