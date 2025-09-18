// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashModel {

 String get id; String get name; String get image; int get rate; int get price; String get description; RestaurantModel get restaurant; String get durationCook;
/// Create a copy of DashModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashModelCopyWith<DashModel> get copyWith => _$DashModelCopyWithImpl<DashModel>(this as DashModel, _$identity);

  /// Serializes this DashModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&(identical(other.durationCook, durationCook) || other.durationCook == durationCook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,rate,price,description,restaurant,durationCook);

@override
String toString() {
  return 'DashModel(id: $id, name: $name, image: $image, rate: $rate, price: $price, description: $description, restaurant: $restaurant, durationCook: $durationCook)';
}


}

/// @nodoc
abstract mixin class $DashModelCopyWith<$Res>  {
  factory $DashModelCopyWith(DashModel value, $Res Function(DashModel) _then) = _$DashModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String image, int rate, int price, String description, RestaurantModel restaurant, String durationCook
});


$RestaurantModelCopyWith<$Res> get restaurant;

}
/// @nodoc
class _$DashModelCopyWithImpl<$Res>
    implements $DashModelCopyWith<$Res> {
  _$DashModelCopyWithImpl(this._self, this._then);

  final DashModel _self;
  final $Res Function(DashModel) _then;

/// Create a copy of DashModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,Object? rate = null,Object? price = null,Object? description = null,Object? restaurant = null,Object? durationCook = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as RestaurantModel,durationCook: null == durationCook ? _self.durationCook : durationCook // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DashModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantModelCopyWith<$Res> get restaurant {
  
  return $RestaurantModelCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashModel].
extension DashModelPatterns on DashModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashModel value)  $default,){
final _that = this;
switch (_that) {
case _DashModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String image,  int rate,  int price,  String description,  RestaurantModel restaurant,  String durationCook)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.rate,_that.price,_that.description,_that.restaurant,_that.durationCook);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String image,  int rate,  int price,  String description,  RestaurantModel restaurant,  String durationCook)  $default,) {final _that = this;
switch (_that) {
case _DashModel():
return $default(_that.id,_that.name,_that.image,_that.rate,_that.price,_that.description,_that.restaurant,_that.durationCook);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String image,  int rate,  int price,  String description,  RestaurantModel restaurant,  String durationCook)?  $default,) {final _that = this;
switch (_that) {
case _DashModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.rate,_that.price,_that.description,_that.restaurant,_that.durationCook);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashModel extends DashModel {
  const _DashModel({required this.id, required this.name, required this.image, required this.rate, required this.price, required this.description, required this.restaurant, required this.durationCook}): super._();
  factory _DashModel.fromJson(Map<String, dynamic> json) => _$DashModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String image;
@override final  int rate;
@override final  int price;
@override final  String description;
@override final  RestaurantModel restaurant;
@override final  String durationCook;

/// Create a copy of DashModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashModelCopyWith<_DashModel> get copyWith => __$DashModelCopyWithImpl<_DashModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&(identical(other.durationCook, durationCook) || other.durationCook == durationCook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,rate,price,description,restaurant,durationCook);

@override
String toString() {
  return 'DashModel(id: $id, name: $name, image: $image, rate: $rate, price: $price, description: $description, restaurant: $restaurant, durationCook: $durationCook)';
}


}

/// @nodoc
abstract mixin class _$DashModelCopyWith<$Res> implements $DashModelCopyWith<$Res> {
  factory _$DashModelCopyWith(_DashModel value, $Res Function(_DashModel) _then) = __$DashModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String image, int rate, int price, String description, RestaurantModel restaurant, String durationCook
});


@override $RestaurantModelCopyWith<$Res> get restaurant;

}
/// @nodoc
class __$DashModelCopyWithImpl<$Res>
    implements _$DashModelCopyWith<$Res> {
  __$DashModelCopyWithImpl(this._self, this._then);

  final _DashModel _self;
  final $Res Function(_DashModel) _then;

/// Create a copy of DashModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,Object? rate = null,Object? price = null,Object? description = null,Object? restaurant = null,Object? durationCook = null,}) {
  return _then(_DashModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as RestaurantModel,durationCook: null == durationCook ? _self.durationCook : durationCook // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DashModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantModelCopyWith<$Res> get restaurant {
  
  return $RestaurantModelCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}

// dart format on
