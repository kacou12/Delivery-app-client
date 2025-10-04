import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my/core/core.dart';
import 'package:my/core/helper/pagination_list.dart';
import 'package:my/core/services/geolocator_service.dart';
import 'package:my/features/restaurants/data/repositories/auth/restaurant_repository_impl.dart';
import 'package:my/features/restaurants/presentation/blocs/restaurant_cubit/restaurant_state.dart';

class RestaurantMapCubit extends Cubit<RestaurantMapState> {
  final RestaurantRepositoryImpl restaurantRepositoryImpl;
  // final LocationService locationService;

  RestaurantMapCubit({
    required this.restaurantRepositoryImpl,
    // required this.locationService,
  }) : super(RestaurantMapInitial());

  Future<void> loadNearbyRestaurants({
    double? lat,
    double? lng,
    double radiusKm = 5.0,
  }) async {
    try {
      emit(RestaurantMapLoading(state));

      LatLng center;
      if (lat != null && lng != null) {
        center = LatLng(lat, lng);
      } else {
        final position = await GeolocatorService.determinePosition();
        // final position = await Geolocator.getCurrentPosition();
        center = LatLng(position.latitude, position.longitude);
      }

      final restaurantsData = await restaurantRepositoryImpl
          .loadNearbyRestaurants(
            lat: center.lat,
            lng: center.lng,
            // radiusKm,
          );

      restaurantsData.fold(
        (l) {
          if (l is ServerFailure) {
            emit(RestaurantMapFailure(errorMessage: l.message, state: state));
          }
        },
        (r) {
          emit(state.copyWith(restaurants: r));
        },
      );
    } catch (e) {
      emit(
        RestaurantMapFailure(
          state: state,
          errorMessage:
              'Erreur lors du chargement des restaurants a proximité : $e',
        ),
      );
    }
  }

  Future<void> searchRestaurants({String query = "", int page = 1}) async {
    if (query.isEmpty) {
      await loadNearbyRestaurants();
      return;
    }

    try {
      emit(RestaurantMapLoading(state));

      // final position = await Geolocator.getCurrentPosition();
      // final center = LatLng(position.latitude, position.longitude);

      final restaurantsData = await restaurantRepositoryImpl.searchRestaurants(
        query: query,
        page: page,
      );

      restaurantsData.fold(
        (l) {
          if (l is ServerFailure) {
            emit(RestaurantMapFailure(errorMessage: l.message, state: state));
          }
        },
        (r) {
          emit(state.copyWith(paginateRestaurants: r));
        },
      );
    } catch (e) {
      emit(
        RestaurantMapFailure(
          state: state,
          errorMessage: 'Erreur lors de la recherche: $e',
        ),
      );
    }
  }

  // void selectRestaurant(Restaurant restaurant) {
  //   final currentState = state;
  //   if (currentState is RestaurantMapLoaded) {
  //     emit(
  //       currentState.copyWith(
  //         selectedRestaurant: restaurant,
  //         mapCenter: LatLng(restaurant.latitude, restaurant.longitude),
  //       ),
  //     );
  //   }
  // }

  // void updateMapCenter(double lat, double lng) {
  //   final currentState = state;
  //   if (currentState is RestaurantMapLoaded) {
  //     emit(currentState.copyWith(mapCenter: LatLng(lat, lng)));
  //   }
  // }
}
