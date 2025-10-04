import 'package:dartz/dartz.dart';
import 'package:my/core/core.dart';
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
  }) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.filterRestaurants(
        requests: requests,
        page: page,
      );

      return response.fold((failure) => Left(failure), (response) async {
        return Right(response);
      });
    } else {
      return const Left(CacheFailure());
    }
  }

  //--------------------------------------------------------------------------

  @override
  FutureResult<List<RestaurantModel>> loadNearbyRestaurants({
    required double lat,
    required double lng,
  }) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.loadNearbyRestaurants(
        lat: lat,
        lng: lng,
      );
      return response.fold((failure) => Left(failure), (
        nearbyRestaurants,
      ) async {
        return Right(nearbyRestaurants);
      });
    } else {
      return const Left(CacheFailure());
    }
  }

  //--------------------------------------------------------------------------

  @override
  FutureResult<PaginationList<RestaurantModel>> searchRestaurants({
    String? query,
    int page = 1,
  }) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.searchRestaurants(
        query: query,
        page: page,
      );

      return response.fold((failure) => Left(failure), (searchResults) async {
        return Right(searchResults);
      });
    } else {
      return const Left(CacheFailure());
    }
  }
}
