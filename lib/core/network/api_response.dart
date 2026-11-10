typedef JsonMap = Map<String, dynamic>;

/// .NET may serialize numbers as strings, so read them leniently.
int? asInt(dynamic value) => switch (value) {
  int v => v,
  num v => v.toInt(),
  String v => int.tryParse(v),
  _ => null,
};

/// Success envelope: `{data: …}` or `{data: […], meta: {…}}`. Empty for 204.
class ApiResponse {
  final dynamic data;
  final ListMeta? meta;

  const ApiResponse({this.data, this.meta});

  factory ApiResponse.fromBody(dynamic body) {
    if (body is! Map<String, dynamic>) return const ApiResponse();
    final meta = body['meta'];
    return ApiResponse(
      data: body['data'],
      meta: meta is Map<String, dynamic> ? ListMeta.fromJson(meta) : null,
    );
  }

  JsonMap get object => data as JsonMap;

  List<T> list<T>(T Function(JsonMap json) fromJson) =>
      (data as List? ?? const []).cast<JsonMap>().map(fromJson).toList();

  ApiPage<T> page<T>(T Function(JsonMap json) fromJson) =>
      ApiPage(items: list(fromJson), meta: meta ?? ListMeta.empty);
}

class ListMeta {
  final int page;
  final int pageSize;
  final int total;
  final bool hasMore;

  const ListMeta({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.hasMore,
  });

  static const empty = ListMeta(page: 1, pageSize: 0, total: 0, hasMore: false);

  factory ListMeta.fromJson(JsonMap json) => ListMeta(
    page: asInt(json['page']) ?? 1,
    pageSize: asInt(json['pageSize']) ?? 0,
    total: asInt(json['total']) ?? 0,
    hasMore: json['hasMore'] as bool? ?? false,
  );
}

/// A page of a paged list; keep loading the next page while [hasMore].
class ApiPage<T> {
  final List<T> items;
  final ListMeta meta;

  const ApiPage({required this.items, required this.meta});

  bool get hasMore => meta.hasMore;
}
