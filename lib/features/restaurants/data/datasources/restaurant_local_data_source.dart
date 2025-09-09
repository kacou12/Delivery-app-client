import 'package:my/core/errors/exceptions.dart';
import 'package:my/core/services/hive/hive.dart';
import 'package:my/core/services/hive/main_box_storage.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';

abstract class RestaurantLocalDataSource {
  Future<RestaurantModel?> loadData();
  Future<void> saveData(RestaurantModel value);
  Future<void> deleteData();
}

const cacheUser = 'cached_restaurant';

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  RestaurantLocalDataSourceImpl();

  @override
  Future<void> saveData(RestaurantModel value) async {
    final local = await MainBoxStorage.create<RestaurantModel>(
      fromJson: RestaurantModel.fromJson,
      toJson: (data) => data.toJson(),
    );

    try {
      await local.save(data: value, key: cacheUser, hasExpiration: false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<RestaurantModel?> loadData() async {
    final local = MainBoxStorage<RestaurantModel>(
      fromJson: RestaurantModel.fromJson,
      toJson: (data) => data.toJson(),
    );

    try {
      return (await local.load(cacheUser))!;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> deleteData() async {
    final local = MainBoxStorage<RestaurantModel>(
      fromJson: RestaurantModel.fromJson,
      toJson: (data) => data.toJson(),
    );
    await local.delete(cacheUser);
  }
}
