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
