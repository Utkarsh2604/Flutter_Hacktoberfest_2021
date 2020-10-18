import 'dart:async';

import 'package:covico/data/db/dao/statewise_dao.dart';
import 'package:covico/data/db/dao/statewise_dao_impl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class AppDatabase {
  factory AppDatabase.init() {
    return AppDatabase._();
  }

  static Database _db;
  StatewiseDao _statewiseDao;


  Future<StatewiseDao> get statewiseDao async {
    if (_db == null) {
      await _openDatabase();
    }
    return _statewiseDao;
  }


  /// Initialize db
  AppDatabase._() {
    if (_db == null) {
      _openDatabase();
    }
  }

  Future _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, 'CoviCo.db');

    _db = await databaseFactoryIo.openDatabase(dbPath);
    _statewiseDao = StatewiseDaoImpl(_db);
  }
}
