import 'package:get_storage/get_storage.dart';

class GetStorages {
  static const user = 'user';
  static const userToken = 'userToken';

  static Future<void> setData(
      {required String key, required String value}) async {
    final box = GetStorage();
    return await box.write(key, value);
  }

  static Future<String> getData({required String key}) async {
    final box = GetStorage();
    var result = await box.read(key);
    return result.toString();
  }

  static void clear() {
    final box = GetStorage();
    box.erase();
  }
}
