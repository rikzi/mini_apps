import 'package:hive/hive.dart';

class LocalStorage {
  static const jsonBox = 'jsonBox';
  static const jsonBackUp = 'jsonBackUp';

  Future<void> savedata(String json) async {
    Box box = await Hive.openBox(LocalStorage.jsonBox);
    await box.put(LocalStorage.jsonBackUp, json);
    print('save');
    box.close();
  }

  Future<String> getData() async {
    Box box = await Hive.openBox(LocalStorage.jsonBox);
    String result = await box.get(LocalStorage.jsonBackUp);
    print('load');
    box.close();
    return result;
  }

  Future<void> saveGambar(String input) async {
    Box box = await Hive.openBox('account');
    await box.put('image', input);
    box.close();
  }

  Future<String> loadGambar() async {
    Box box = await Hive.openBox('account');
    String result = await box.get('image');
    return result;
  }
}
