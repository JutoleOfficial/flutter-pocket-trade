class DataResponse<T> {
  final T data;

  DataResponse({required this.data});

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return DataResponse<T>(
      data: fromJsonT(json['data'] as Map<String, dynamic>),
    );
  }
}

class DataListResponse<T> {
  final List<T> data;

  DataListResponse({required this.data});

  factory DataListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return DataListResponse<T>(
      data: (json['data'] as List<dynamic>).map((item) {
        return fromJsonT(item as Map<String, dynamic>);
      }).toList(),
    );
  }
}
