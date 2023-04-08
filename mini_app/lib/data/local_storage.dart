import 'package:hive/hive.dart';

enum LocalStorageUser {
  imageUrl,
  name,
  email,
}

class LocalStorage {
  final _jsonBoxKey = 'jsonBox';
  final _jsonBackUpKey = 'jsonBackUp';
  final _userBoxKey = 'user';
  final _imageUrlKey = 'imageUrl';
  final _nameKey = 'name';
  final _emailKey = 'email';

  // Future<Box> openBox(String keyBox) async {
  //   Box box = await Hive.openBox(keyBox);
  //   return box;
  // }

  Future<void> savedataJson(String json) async {
    Box boxJson = await Hive.openBox(_jsonBoxKey);
    await boxJson.put(_jsonBackUpKey, json);
    boxJson.close();
  }

  Future<String> getDataJson() async {
    Box boxJson = await Hive.openBox(_jsonBoxKey);
    String result = await boxJson.get(_jsonBackUpKey);
    boxJson.close();
    return result;
  }

  Future<void> saveUser(String imageUrl, String name, String email) async {
    Box boxAccount = await Hive.openBox(_userBoxKey);
    await boxAccount
        .putAll({_imageUrlKey: imageUrl, _nameKey: name, _emailKey: email});
    boxAccount.close();
  }

  Future<String> loadUser({required LocalStorageUser localStorageUser}) async {
    Box boxAccount = await Hive.openBox(_userBoxKey);
    switch (localStorageUser) {
      case LocalStorageUser.imageUrl:
        String result = await boxAccount.get(_imageUrlKey);
        return result;
      case LocalStorageUser.name:
        String result = await boxAccount.get(_nameKey);
        return result;
      case LocalStorageUser.email:
        String result = await boxAccount.get(_emailKey);
        return result;
      default:
        return '';
    }
  }

  Future<void> initialHive() async {
    Box box = await Hive.openBox(_userBoxKey);
  }
}
