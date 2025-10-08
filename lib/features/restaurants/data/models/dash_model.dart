import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:woudy_customers_app/features/restaurants/data/models/restaurant_model.dart';

part 'dash_model.freezed.dart';
part 'dash_model.g.dart';

@freezed
abstract class DashModel with _$DashModel {
  const DashModel._();
  const factory DashModel({
    required String id,
    required String name,
    required String image,
    required int rate,
    required int price,
    required String description,
    required RestaurantModel restaurant,
    required String durationCook,
  }) = _DashModel;

  factory DashModel.emptyData() {
    return DashModel(
      id: '',
      name: '',
      description: '',
      image: '',
      rate: 0,
      price: 0,
      restaurant: RestaurantModel.emptyData(),
      durationCook: '00H00',
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

  factory DashModel.fromJson(Map<String, dynamic> json) =>
      _$DashModelFromJson(json);
}
