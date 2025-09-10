// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationList<T> implements DiagnosticableTreeMixin {

 List<T> get items; int? get total;@JsonKey(name: 'has_next') bool? get hasNext;
/// Create a copy of PaginationList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationListCopyWith<T, PaginationList<T>> get copyWith => _$PaginationListCopyWithImpl<T, PaginationList<T>>(this as PaginationList<T>, _$identity);

  /// Serializes this PaginationList to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationList<$T>'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasNext', hasNext));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationList<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,hasNext);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationList<$T>(items: $items, total: $total, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $PaginationListCopyWith<T,$Res>  {
  factory $PaginationListCopyWith(PaginationList<T> value, $Res Function(PaginationList<T>) _then) = _$PaginationListCopyWithImpl;
@useResult
$Res call({
 List<T> items, int? total,@JsonKey(name: 'has_next') bool? hasNext
});




}
/// @nodoc
class _$PaginationListCopyWithImpl<T,$Res>
    implements $PaginationListCopyWith<T, $Res> {
  _$PaginationListCopyWithImpl(this._self, this._then);

  final PaginationList<T> _self;
  final $Res Function(PaginationList<T>) _then;

/// Create a copy of PaginationList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = freezed,Object? hasNext = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,hasNext: freezed == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationList].
extension PaginationListPatterns<T> on PaginationList<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationList<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationList() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationList<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginationList():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationList<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationList() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  int? total, @JsonKey(name: 'has_next')  bool? hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationList() when $default != null:
return $default(_that.items,_that.total,_that.hasNext);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  int? total, @JsonKey(name: 'has_next')  bool? hasNext)  $default,) {final _that = this;
switch (_that) {
case _PaginationList():
return $default(_that.items,_that.total,_that.hasNext);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  int? total, @JsonKey(name: 'has_next')  bool? hasNext)?  $default,) {final _that = this;
switch (_that) {
case _PaginationList() when $default != null:
return $default(_that.items,_that.total,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationList<T> with DiagnosticableTreeMixin implements PaginationList<T> {
  const _PaginationList({required final  List<T> items, this.total, @JsonKey(name: 'has_next') this.hasNext}): _items = items;
  factory _PaginationList.fromJson(Map<String, dynamic> json) => _$PaginationListFromJson(json);

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int? total;
@override@JsonKey(name: 'has_next') final  bool? hasNext;

/// Create a copy of PaginationList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationListCopyWith<T, _PaginationList<T>> get copyWith => __$PaginationListCopyWithImpl<T, _PaginationList<T>>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationListToJson<T>(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationList<$T>'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('hasNext', hasNext));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationList<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,hasNext);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationList<$T>(items: $items, total: $total, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$PaginationListCopyWith<T,$Res> implements $PaginationListCopyWith<T, $Res> {
  factory _$PaginationListCopyWith(_PaginationList<T> value, $Res Function(_PaginationList<T>) _then) = __$PaginationListCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int? total,@JsonKey(name: 'has_next') bool? hasNext
});




}
/// @nodoc
class __$PaginationListCopyWithImpl<T,$Res>
    implements _$PaginationListCopyWith<T, $Res> {
  __$PaginationListCopyWithImpl(this._self, this._then);

  final _PaginationList<T> _self;
  final $Res Function(_PaginationList<T>) _then;

/// Create a copy of PaginationList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = freezed,Object? hasNext = freezed,}) {
  return _then(_PaginationList<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,hasNext: freezed == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
