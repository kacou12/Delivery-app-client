import 'package:my/core/helper/helper_type.dart';
import 'package:my/core/utils/typedefs.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';
import 'package:my/features/restaurants/data/payload/requests/filters_restaurant_request.dart';

abstract class RestaurantRepository {
  FutureResult<PaginationList<RestaurantModel>> loadNearbyRestaurants({
    required double lat,
    required double lng,
  });

  FutureResult<PaginationList<RestaurantModel>> searchRestaurants(String query);
  FutureResult<PaginationList<RestaurantModel>> filterRestaurants({
    required FilterRestaurantsRequest requests,
  });
}
