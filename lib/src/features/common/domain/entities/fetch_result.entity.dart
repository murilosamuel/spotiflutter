class FetchResult<T> {
  bool isLast;
  List<T>? payload;

  FetchResult({
    this.isLast = true,
    this.payload,
  });
}
