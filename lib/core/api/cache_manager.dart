import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
// import 'package:dio_cache_interceptor/hive_store.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';

class CacheOptionsParameters {
  final Duration? fixedDuration;
  final DateTime? expireAt;
  final int? secondsFromNow;
  final CachePolicy policy;

  CacheOptionsParameters({
    this.fixedDuration,
    this.expireAt,
    this.secondsFromNow,
    this.policy = CachePolicy.request,
  });
}

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  late final DioCacheInterceptor _cacheInterceptor;
  late final CacheOptions _defaultOptions;

  factory CacheManager() {
    return _instance;
  }

  CacheManager._internal() {
    _defaultOptions = createCacheOptions(fixedDuration: Duration(hours: 1));
    _cacheInterceptor = DioCacheInterceptor(options: _defaultOptions);
  }

  /// Attach the cache interceptor to Dio
  void attachToDio(Dio dio) {
    dio.interceptors.add(_cacheInterceptor);
  }

  /// Returns CacheOptions based on duration, expiry, or seconds
  CacheOptions createCacheOptions({
    Duration? fixedDuration,
    DateTime? expireAt,
    int? secondsFromNow,
    CachePolicy policy = CachePolicy.request,
  }) {
    Duration duration;

    if (fixedDuration != null) {
      duration = fixedDuration;
    } else if (secondsFromNow != null) {
      duration = Duration(seconds: secondsFromNow);
    } else if (expireAt != null) {
      final now = DateTime.now();
      duration = expireAt.isAfter(now)
          ? expireAt.difference(now)
          : Duration.zero;
    } else {
      duration = Duration(hours: 1); // default fallback
    }

    return CacheOptions(
      store: HiveCacheStore(
        'cache_directory',
      ), // or MemCacheStore() for in-memory
      policy: policy,
      maxStale: duration,
      priority: CachePriority.normal,
      hitCacheOnErrorCodes: [401, 403],
    );
  }

  /// Shortcut: Cache until midnight
  CacheOptions cacheUntilMidnight() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    return createCacheOptions(expireAt: midnight);
  }

  /// Shortcut: Cache for a specific number of seconds
  CacheOptions cacheForSeconds(int seconds) {
    return createCacheOptions(secondsFromNow: seconds);
  }

  /// Shortcut: Default options (1 hour)
  CacheOptions get defaultOptions => _defaultOptions;
}
