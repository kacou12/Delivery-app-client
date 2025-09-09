// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    _RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      rating: json['rating'] as String,
      imageUrl: json['image_url'] as String,
      openHour: json['openHour'] as String,
      closeHour: json['closeHour'] as String,
    );

Map<String, dynamic> _$RestaurantModelToJson(_RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
      'image_url': instance.imageUrl,
      'openHour': instance.openHour,
      'closeHour': instance.closeHour,
    };
