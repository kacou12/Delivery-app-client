// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashModel _$DashModelFromJson(Map<String, dynamic> json) => _DashModel(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  rate: (json['rate'] as num).toInt(),
  description: json['description'] as String,
  restaurant: RestaurantModel.fromJson(
    json['restaurant'] as Map<String, dynamic>,
  ),
  durationCook: json['durationCook'] as String,
);

Map<String, dynamic> _$DashModelToJson(_DashModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'rate': instance.rate,
      'description': instance.description,
      'restaurant': instance.restaurant,
      'durationCook': instance.durationCook,
    };
