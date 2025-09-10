import 'package:equatable/equatable.dart';
import 'package:my/core/helper/helper_type.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';

class RestaurantMapState extends Equatable {
  final List<RestaurantModel>? restaurants;
  final PaginationList<RestaurantModel>? paginateRestaurants;
  final RestaurantModel? selectedRestaurant;
  final LatLng? mapCenter;
  final String? searchQuery;
  // final bool? isLoading;
  // final String? errorMessage;

  const RestaurantMapState({
    this.restaurants = const [],
    this.selectedRestaurant,
    this.paginateRestaurants,
    this.mapCenter,
    this.searchQuery,
    // this.isLoading,
    // this.errorMessage,
  });

  @override
  List<Object?> get props => [
    restaurants,
    selectedRestaurant,
    paginateRestaurants,
    mapCenter,
    searchQuery,
    // isLoading,
    // errorMessage,
  ];

  RestaurantMapState copyWith({
    List<RestaurantModel>? restaurants,
    RestaurantModel? selectedRestaurant,
    PaginationList<RestaurantModel>? paginateRestaurants,
    LatLng? mapCenter,
    String? searchQuery,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RestaurantMapState(
      restaurants: restaurants ?? this.restaurants,
      selectedRestaurant: selectedRestaurant ?? this.selectedRestaurant,
      mapCenter: mapCenter ?? this.mapCenter,
      searchQuery: searchQuery ?? this.searchQuery,
      paginateRestaurants: paginateRestaurants ?? this.paginateRestaurants,
      // isLoading: isLoading ?? this.isLoading,
      // errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class RestaurantMapInitial extends RestaurantMapState {
  const RestaurantMapInitial() : super();
}

class RestaurantMapFailure extends RestaurantMapState {
  final String errorMessage;

  RestaurantMapFailure({
    required this.errorMessage,
    required RestaurantMapState state,
    // required String errorMessage,
  }) : super(
         //  isLoading: false,
         //  errorMessage: errorMessage,
         mapCenter: state.mapCenter,
         paginateRestaurants: state.paginateRestaurants,
         restaurants: state.restaurants,
         searchQuery: state.searchQuery,
         selectedRestaurant: state.selectedRestaurant,
       );
}

class RestaurantMapLoading extends RestaurantMapState {
  final bool isLoading;
  RestaurantMapLoading(RestaurantMapState state, {this.isLoading = true})
    : super(
        // isLoading: true,
        // errorMessage: null,
        mapCenter: state.mapCenter,
        paginateRestaurants: state.paginateRestaurants,
        restaurants: state.restaurants,
        searchQuery: state.searchQuery,
        selectedRestaurant: state.selectedRestaurant,
      );
}
