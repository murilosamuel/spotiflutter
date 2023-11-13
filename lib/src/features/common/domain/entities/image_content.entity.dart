class ImageContent {
  final String? url;
  final num? height;
  final int? width;

  ImageContent({
    this.url,
    this.height,
    this.width,
  });


  @override
  String toString() {
    return url ?? '';
  }
}