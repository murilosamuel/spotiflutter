class ExternalUrls {
  final String? spotify;

  ExternalUrls({
    this.spotify,
  });
  @override
  String toString() {
    return spotify ?? '';
  }
}