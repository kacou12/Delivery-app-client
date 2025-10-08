import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:path_provider/path_provider.dart';

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
  static CacheManager? _instance;
  late final DioCacheInterceptor _cacheInterceptor;
  late final CacheOptions _defaultOptions;
  late final HiveCacheStore _cacheStore;

  CacheManager._internal();

  /// Initialisation asynchrone obligatoire
  static Future<CacheManager> initialize() async {
    if (_instance == null) {
      _instance = CacheManager._internal();
      await _instance!._init();
    }
    return _instance!;
  }

  /// Accès à l'instance (doit être initialisée au préalable)
  static CacheManager get instance {
    if (_instance == null) {
      throw StateError(
        'CacheManager must be initialized first. Call CacheManager.initialize() before accessing instance.',
      );
    }
    return _instance!;
  }

  Future<void> _init() async {
    final cacheDir = await getTemporaryDirectory();
    _cacheStore = HiveCacheStore(cacheDir.path);

    _defaultOptions = CacheOptions(
      store: _cacheStore,
      policy: CachePolicy.request,
      maxStale: Duration(hours: 1),
      priority: CachePriority.normal,
      hitCacheOnErrorCodes: [401, 403],
    );

    _cacheInterceptor = DioCacheInterceptor(options: _defaultOptions);
  }

  void attachToDio(Dio dio) {
    dio.interceptors.add(_cacheInterceptor);
  }

  CacheOptions createCacheOptions({
    Duration? fixedDuration,
    DateTime? expireAt,
    int? secondsFromNow,
    CachePolicy? policy = CachePolicy.request,
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
      duration = Duration(hours: 1);
    }

    return CacheOptions(
      store: _cacheStore,
      policy: policy!,
      maxStale: duration,
      priority: CachePriority.normal,
      hitCacheOnErrorCodes: [401, 403],
    );
  }

  CacheOptions cacheUntilMidnight() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    return createCacheOptions(expireAt: midnight);
  }

  CacheOptions cacheForSeconds(int seconds) {
    return createCacheOptions(secondsFromNow: seconds);
  }

  CacheOptions get defaultOptions => _defaultOptions;
}
