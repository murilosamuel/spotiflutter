class RestrictionsDto {
  final String? reason;

  RestrictionsDto({
    this.reason,
  });

  factory RestrictionsDto.fromJson(Map<String, dynamic> json) {
    return RestrictionsDto(
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() => {
    'reason': reason,
  };

  @override
  String toString() {
    return '$reason';
  }
}