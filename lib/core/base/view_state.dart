enum ViewState {
  initial,
  loading,
  loadingMore,
  success,
  error,
}

class BaseState<T> {
  final ViewState state;
  final T? data;
  final String? error;

  const BaseState._({
    this.state = ViewState.initial,
    this.data,
    this.error,
  });

  factory BaseState.initial() => BaseState._();

  factory BaseState.loading() => BaseState._(state: ViewState.loading);

  factory BaseState.loadingMore(T existingData) => BaseState._(
        state: ViewState.loadingMore,
        data: existingData,
      );

  factory BaseState.success(T data) => BaseState._(
        state: ViewState.success,
        data: data,
      );

  factory BaseState.error(String message) => BaseState._(
        state: ViewState.error,
        error: message,
      );

  bool get isInitial => state == ViewState.initial;
  bool get isLoading => state == ViewState.loading;
  bool get isLoadingMore => state == ViewState.loadingMore;
  bool get isSuccess => state == ViewState.success;
  bool get isError => state == ViewState.error;
}
