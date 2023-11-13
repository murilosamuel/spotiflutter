class Followers {
  final String? href;
  final num? total;

  Followers({
    this.href,
    this.total,
  });

  @override
  String toString() {
    return '$href - $total';
  }
}
