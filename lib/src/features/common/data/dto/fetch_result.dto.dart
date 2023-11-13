class FetchResultDto<T> {
  bool isLast;
  List<T>? payload;

  FetchResultDto({
    this.isLast = true,
    this.payload,
  });
}
