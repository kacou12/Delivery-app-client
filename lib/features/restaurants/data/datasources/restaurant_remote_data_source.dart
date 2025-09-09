import 'package:my/core/api/dio_client.dart';
import 'package:my/core/core.dart';
import 'package:my/core/helper/helper_type.dart';
import 'package:my/core/utils/typedefs.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';
import 'package:my/features/restaurants/data/payload/requests/filters_restaurant_request.dart';

abstract class RestaurantRemoteDataSource {
  FutureResult<PaginationList<RestaurantModel>> loadNearbyRestaurants({
    required double lat,
    required double lng,
  });

  FutureResult<PaginationList<RestaurantModel>> searchRestaurants(
    String? query,
  );
  FutureResult<PaginationList<RestaurantModel>> filterRestaurants({
    required FilterRestaurantsRequest requests,
  });
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final DioClient dio;

  RestaurantRemoteDataSourceImpl(this.dio);

  @override
  FutureResult<PaginationList<RestaurantModel>> filterRestaurants({
    required FilterRestaurantsRequest requests,
  }) async {
    final response = await dio.getRequest(
      ListAPI.filterRestaurants,
      queryParameters: requests.toJson(),
      converter: (response) => PaginationList<RestaurantModel>.fromJson(
        response as Map<String, dynamic>,
      ),

      // converter: (response) => List<RestaurantModel>.from(
      //   (response as List).map(
      //     (x) => RestaurantModel.fromJson(x as Map<String, dynamic>),
      //   ),
      // ),
    );
    return response;
  }

  @override
  FutureResult<PaginationList<RestaurantModel>> searchRestaurants(
    String? query,
  ) async {
    final response = await dio.getRequest(
      ListAPI.searchRestaurants,

      converter: (response) => PaginationList<RestaurantModel>.fromJson(
        response as Map<String, dynamic>,
      ),
    );
    return response;
  }

  @override
  FutureResult<PaginationList<RestaurantModel>> loadNearbyRestaurants({
    required double lat,
    required double lng,
  }) async {
    final response = await dio.getRequest(
      ListAPI.nearbyRestaurants,
      queryParameters: {'lat': lat, 'lng': lng},
      converter: (response) => PaginationList<RestaurantModel>.fromJson(
        response as Map<String, dynamic>,
      ),
    );
    return response;
  }
}
