class HomeState {
  int pageIndex;

  HomeState({
    required this.pageIndex,
  });

  HomeState copyWith({
    int? pageIndex,
  }) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
