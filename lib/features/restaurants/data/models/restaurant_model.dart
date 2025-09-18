import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
abstract class RestaurantModel with _$RestaurantModel {
  const RestaurantModel._();
  const factory RestaurantModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'latitude') required String latitude,
    @JsonKey(name: 'longitude') required String longitude,
    @JsonKey(name: 'rating') required String rating,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'openHour') required String openHour,
    @JsonKey(name: 'closeHour') required String closeHour,
  }) = _RestaurantModel;

  factory RestaurantModel.emptyData() {
    return RestaurantModel(
      id: '',
      name: '',
      address: '',
      latitude: '',
      longitude: '',
      rating: '',
      imageUrl: '',
      openHour: '',
      closeHour: '',
    );
  }

  Map<String, int> parseTime(String timeString) {
    try {
      final parts = timeString.split('H');
      return {'hour': int.parse(parts[0]), 'minute': int.parse(parts[1])};
    } catch (e) {
      // Handle potential parsing errors if the format is invalid
      print("Error parsing time: $timeString");
      return {'hour': 0, 'minute': 0}; // Default or error value
    }
  }

  // Implement the isOpen getter here
  bool get isOpen {
    final now = DateTime.now();
    final currentHour = now.hour;
    final currentMinute = now.minute;

    // A helper function to parse "14H30" to a Map {hour: 14, minute: 30}

    final openTime = parseTime(openHour);
    final closeTime = parseTime(closeHour);

    final openHourInt = openTime['hour']!;
    final openMinuteInt = openTime['minute']!;
    final closeHourInt = closeTime['hour']!;
    final closeMinuteInt = closeTime['minute']!;

    // Case 1: Restaurant closes the same day (e.g., 10:00 - 22:00)
    if (openHourInt < closeHourInt ||
        (openHourInt == closeHourInt && openMinuteInt < closeMinuteInt)) {
      final isAfterOpen =
          currentHour > openHourInt ||
          (currentHour == openHourInt && currentMinute >= openMinuteInt);
      final isBeforeClose =
          currentHour < closeHourInt ||
          (currentHour == closeHourInt && currentMinute < closeMinuteInt);

      return isAfterOpen && isBeforeClose;
    }
    // Case 2: Restaurant closes the next day (e.g., 22:00 - 02:00)
    else {
      final isAfterOpen =
          currentHour > openHourInt ||
          (currentHour == openHourInt && currentMinute >= openMinuteInt);
      final isBeforeClose =
          currentHour < closeHourInt ||
          (currentHour == closeHourInt && currentMinute < closeMinuteInt);

      return isAfterOpen || isBeforeClose;
    }
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
