class PaginationList<T> {
  const PaginationList({required this.items, this.total, this.hasNext});

  final List<T> items;
  final int? total;
  final bool? hasNext;

  factory PaginationList.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final items = (json['items'] as List<dynamic>)
        .map((item) => fromJsonT(item))
        .toList();
    final total = json['total'] as int?;
    final hasNext = json['has_next'] as bool?;

    return PaginationList<T>(items: items, total: total, hasNext: hasNext);
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'items': items.map(toJsonT).toList(),
      'total': total,
      'has_next': hasNext,
    };
  }

  @override
  String toString() {
    return 'PaginationList(items: ${items.length}, total: $total, hasNext: $hasNext)';
  }
}

class LatLng {
  final double lat;
  final double lng;

  LatLng(this.lat, this.lng);

  factory LatLng.fromJson(Map<String, dynamic> json) {
    return LatLng(json['lat'] as double, json['lng'] as double);
  }
}
