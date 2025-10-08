import 'package:equatable/equatable.dart';
import 'package:woudy_customers_app/core/helper/pagination_list.dart';
import 'package:woudy_customers_app/features/restaurants/data/models/restaurant_model.dart';

class RestaurantMapState extends Equatable {
  final List<RestaurantModel>? restaurants;
  final PaginationList<RestaurantModel>? paginateRestaurants;
  final RestaurantModel? selectedRestaurant;
  final LatLng? mapCenter;
  final String? searchQuery;

  const RestaurantMapState({
    this.restaurants = const [],
    this.selectedRestaurant,
    this.paginateRestaurants,
    this.mapCenter,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
    restaurants,
    selectedRestaurant,
    paginateRestaurants,
    mapCenter,
    searchQuery,
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
  }) : super(
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
        mapCenter: state.mapCenter,
        paginateRestaurants: state.paginateRestaurants,
        restaurants: state.restaurants,
        searchQuery: state.searchQuery,
        selectedRestaurant: state.selectedRestaurant,
      );
}
