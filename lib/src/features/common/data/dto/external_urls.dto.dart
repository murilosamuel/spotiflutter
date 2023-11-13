class ExternalUrlsDto {
  final String? spotify;

  ExternalUrlsDto({
    this.spotify,
  });

  factory ExternalUrlsDto.fromJson(Map<String, dynamic> json) {
    return ExternalUrlsDto(
      spotify: json['spotify'],
    );
  }

  Map<String, dynamic> toJson() => {
    'spotify': spotify,
  };

  @override
  String toString() {
    return spotify ?? '';
  }
}