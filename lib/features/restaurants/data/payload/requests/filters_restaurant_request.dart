import 'package:equatable/equatable.dart';

class FilterRestaurantsRequest extends Equatable {
  final String? name;
  final int? rating;

  const FilterRestaurantsRequest({this.name, this.rating});

  @override
  List<Object?> get props => [name, rating];

  Map<String, dynamic> toJson() => {'name': name, 'rating': rating};
}
