import 'package:my/core/helper/pagination_list.dart';
import 'package:my/core/network/network_info.dart';
import 'package:my/core/utils/typedefs.dart';
import 'package:my/features/restaurants/data/datasources/restaurant_local_data_source.dart';
import 'package:my/features/restaurants/data/datasources/restaurant_remote_data_source.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';
import 'package:my/features/restaurants/data/payload/requests/filters_restaurant_request.dart';
import 'package:my/features/restaurants/data/repositories/auth/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final RestaurantLocalDataSource store;
  bool isInitialize = false;

  RestaurantRepositoryImpl(this.remoteDataSource, this.networkInfo, this.store);

  @override
  FutureResult<PaginationList<RestaurantModel>> filterRestaurants({
    required FilterRestaurantsRequest requests,
    int page = 1,
  }) {
    // TODO: implement filterRestaurants
    throw UnimplementedError();
  }

  @override
  FutureResult<List<RestaurantModel>> loadNearbyRestaurants({
    required double lat,
    required double lng,
  }) {
    // TODO: implement loadNearbyRestaurants
    throw UnimplementedError();
  }

  @override
  FutureResult<PaginationList<RestaurantModel>> searchRestaurants({
    String? query,
    int page = 1,
  }) {
    // TODO: implement searchRestaurants
    throw UnimplementedError();
  }
}
