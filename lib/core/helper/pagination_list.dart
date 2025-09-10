import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pagination_list.freezed.dart';
part 'pagination_list.g.dart';

@freezed(genericArgumentFactories: true)
class PaginationList<T> with _$PaginationList<T> {
  const factory PaginationList({
    required List<T> items,
    int? total,
    @JsonKey(name: 'has_next') bool? hasNext,
  }) = _PaginationList;

  factory PaginationList.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginationListFromJson(json, fromJsonT);
}

// class LatLng {
//   final double lat;
//   final double lng;

//   LatLng(this.lat, this.lng);

//   factory LatLng.fromJson(Map<String, dynamic> json) {
//     return LatLng(json['lat'] as double, json['lng'] as double);
//   }
// }
