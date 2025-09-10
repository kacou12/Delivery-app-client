import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

@freezed
class PaginationList<T> with _$PaginationList<T> {
  const factory PaginationList({
    required List<T> items,
    int? total,
    @JsonKey(name: 'has_next') bool? hasNext,
  }) = _PaginationList;

  factory PaginationList.fromJson(Map<String, dynamic> json) =>
      _$PaginationListFromJson(json);
}

class LatLng {
  final double lat;
  final double lng;

  LatLng(this.lat, this.lng);

  factory LatLng.fromJson(Map<String, dynamic> json) {
    return LatLng(json['lat'] as double, json['lng'] as double);
  }
}
