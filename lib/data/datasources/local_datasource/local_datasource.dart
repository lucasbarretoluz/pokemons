import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatasource {
  final Box box;
  const LocalDatasource(this.box);
  final String listKey = 'favourites';

  List<String> fetchFavouritesList() {
    return box.get(listKey) ?? [];
  }

  Future<bool> saveToFavouritesList(String id) async {
    List<String> list = fetchFavouritesList();
    if (!list.contains(id)) {
      list.add(id);
    }
    await box.put(listKey, list);
    List<String> listTest = box.get(listKey);

    return listTest.contains(id) ? true : false;
  }

  bool checkIfFavourite(String id) {
    List<String> list = box.get(listKey);
    return list.contains(id) ? true : false;
  }

  Future<bool> removeFromFavourites(String id) async {
    List<String> list = fetchFavouritesList();
    if (list.contains(id)) {
      list.remove(id);
    }

    await box.put(listKey, list);
    List<String> listTest = box.get(listKey);

    return listTest.contains(id) ? true : false;
  }

  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  }
}
