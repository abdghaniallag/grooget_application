import '../network/app_api.dart';

const CACH_HOME_KEY = 'CACH_HOME_KEY';
const CACH_HOME_VALID_TIME = 60 * 1000;

abstract class LocalDataSource {
  clearDataSource();
  removeDataSource(String key);
}

class LocalDataSourceImplimenter implements LocalDataSource {
  AppServiceClient _appServiceClient;
  LocalDataSourceImplimenter(this._appServiceClient);
  Map<String, CachedItems> cacheMap = Map();

  @override
  clearDataSource() {
    cacheMap.clear();
  }

  @override
  removeDataSource(String key) {
    cacheMap.remove(key);
  }
}

class CachedItems {
  dynamic data;
  int cahedTime = DateTime.now().millisecondsSinceEpoch;
  CachedItems(this.data);
}

extension CacheItemsExtension on CachedItems {
  bool isCacheValid(int expectation) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    return currentTime - expectation < cahedTime;
  }
}
