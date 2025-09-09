// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantModel implements DiagnosticableTreeMixin {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'address') String get address;@JsonKey(name: 'latitude') String get latitude;@JsonKey(name: 'longitude') String get longitude;@JsonKey(name: 'rating') String get rating;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'openHour') String get openHour;@JsonKey(name: 'closeHour') String get closeHour;
/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantModelCopyWith<RestaurantModel> get copyWith => _$RestaurantModelCopyWithImpl<RestaurantModel>(this as RestaurantModel, _$identity);

  /// Serializes this RestaurantModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RestaurantModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('rating', rating))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('openHour', openHour))..add(DiagnosticsProperty('closeHour', closeHour));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.openHour, openHour) || other.openHour == openHour)&&(identical(other.closeHour, closeHour) || other.closeHour == closeHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude,rating,imageUrl,openHour,closeHour);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RestaurantModel(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, rating: $rating, imageUrl: $imageUrl, openHour: $openHour, closeHour: $closeHour)';
}


}

/// @nodoc
abstract mixin class $RestaurantModelCopyWith<$Res>  {
  factory $RestaurantModelCopyWith(RestaurantModel value, $Res Function(RestaurantModel) _then) = _$RestaurantModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'address') String address,@JsonKey(name: 'latitude') String latitude,@JsonKey(name: 'longitude') String longitude,@JsonKey(name: 'rating') String rating,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'openHour') String openHour,@JsonKey(name: 'closeHour') String closeHour
});




}
/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._self, this._then);

  final RestaurantModel _self;
  final $Res Function(RestaurantModel) _then;

/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? rating = null,Object? imageUrl = null,Object? openHour = null,Object? closeHour = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,openHour: null == openHour ? _self.openHour : openHour // ignore: cast_nullable_to_non_nullable
as String,closeHour: null == closeHour ? _self.closeHour : closeHour // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantModel].
extension RestaurantModelPatterns on RestaurantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantModel value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantModel value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'address')  String address, @JsonKey(name: 'latitude')  String latitude, @JsonKey(name: 'longitude')  String longitude, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'openHour')  String openHour, @JsonKey(name: 'closeHour')  String closeHour)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.rating,_that.imageUrl,_that.openHour,_that.closeHour);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'address')  String address, @JsonKey(name: 'latitude')  String latitude, @JsonKey(name: 'longitude')  String longitude, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'openHour')  String openHour, @JsonKey(name: 'closeHour')  String closeHour)  $default,) {final _that = this;
switch (_that) {
case _RestaurantModel():
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.rating,_that.imageUrl,_that.openHour,_that.closeHour);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'address')  String address, @JsonKey(name: 'latitude')  String latitude, @JsonKey(name: 'longitude')  String longitude, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'openHour')  String openHour, @JsonKey(name: 'closeHour')  String closeHour)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.rating,_that.imageUrl,_that.openHour,_that.closeHour);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantModel extends RestaurantModel with DiagnosticableTreeMixin {
  const _RestaurantModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'address') required this.address, @JsonKey(name: 'latitude') required this.latitude, @JsonKey(name: 'longitude') required this.longitude, @JsonKey(name: 'rating') required this.rating, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'openHour') required this.openHour, @JsonKey(name: 'closeHour') required this.closeHour}): super._();
  factory _RestaurantModel.fromJson(Map<String, dynamic> json) => _$RestaurantModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'address') final  String address;
@override@JsonKey(name: 'latitude') final  String latitude;
@override@JsonKey(name: 'longitude') final  String longitude;
@override@JsonKey(name: 'rating') final  String rating;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'openHour') final  String openHour;
@override@JsonKey(name: 'closeHour') final  String closeHour;

/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantModelCopyWith<_RestaurantModel> get copyWith => __$RestaurantModelCopyWithImpl<_RestaurantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RestaurantModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('rating', rating))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('openHour', openHour))..add(DiagnosticsProperty('closeHour', closeHour));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.openHour, openHour) || other.openHour == openHour)&&(identical(other.closeHour, closeHour) || other.closeHour == closeHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude,rating,imageUrl,openHour,closeHour);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RestaurantModel(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, rating: $rating, imageUrl: $imageUrl, openHour: $openHour, closeHour: $closeHour)';
}


}

/// @nodoc
abstract mixin class _$RestaurantModelCopyWith<$Res> implements $RestaurantModelCopyWith<$Res> {
  factory _$RestaurantModelCopyWith(_RestaurantModel value, $Res Function(_RestaurantModel) _then) = __$RestaurantModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'address') String address,@JsonKey(name: 'latitude') String latitude,@JsonKey(name: 'longitude') String longitude,@JsonKey(name: 'rating') String rating,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'openHour') String openHour,@JsonKey(name: 'closeHour') String closeHour
});




}
/// @nodoc
class __$RestaurantModelCopyWithImpl<$Res>
    implements _$RestaurantModelCopyWith<$Res> {
  __$RestaurantModelCopyWithImpl(this._self, this._then);

  final _RestaurantModel _self;
  final $Res Function(_RestaurantModel) _then;

/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? rating = null,Object? imageUrl = null,Object? openHour = null,Object? closeHour = null,}) {
  return _then(_RestaurantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,openHour: null == openHour ? _self.openHour : openHour // ignore: cast_nullable_to_non_nullable
as String,closeHour: null == closeHour ? _self.closeHour : closeHour // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
