import 'package:woudy_customers_app/core/helper/pagination_list.dart';
import 'package:woudy_customers_app/core/utils/typedefs.dart';
import 'package:woudy_customers_app/features/restaurants/data/models/restaurant_model.dart';
import 'package:woudy_customers_app/features/restaurants/data/payload/requests/filters_restaurant_request.dart';

abstract class RestaurantRepository {
  FutureResult<List<RestaurantModel>> loadNearbyRestaurants({
    required double lat,
    required double lng,
  });

  FutureResult<PaginationList<RestaurantModel>> searchRestaurants({
    String? query,
    int page = 1,
  });
  FutureResult<PaginationList<RestaurantModel>> filterRestaurants({
    required FilterRestaurantsRequest requests,
    int page = 1,
  });
}
