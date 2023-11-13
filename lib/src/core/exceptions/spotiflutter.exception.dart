abstract class SpotiflutterException implements Exception {
  String message;

  SpotiflutterException(this.message);

  @override
  String toString() {
    return message;
  }
}
