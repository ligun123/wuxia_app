import 'dart:convert';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

/// sqflite插件对db进行了单例管理，不会重复打开同一path的db
/// sqlite管理类，帮助关闭、打开，增删查改。
/// kv表：键值对存储；
/// scache：服务器接口数据缓存；
/// lcache：客户端输入数据缓存，数据未到达服务器则会存到这里；
/// error：错误数据表，区分服务器错误（主要是网络错误）和客户端错误，到达服务器后返回的错误有服务器日志负责
class XDBManager {
  static const String _kv = 'kv';
  static const String _scache = 'scache';
  // static const String _lcache = 'lcache';//TODO
  static const String _error = 'error';

  static final XDBManager shared = XDBManager._();
  XDBManager._();

  Database _db;

  openDB() async {
    if (_db == null || _db.isOpen == false) {
      final path = await dbPath();
      print('sqlite: $path');
      _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
        final kv = '''
          CREATE TABLE IF NOT EXISTS $_kv (
          id INTEGER,
          key TEXT NOT NULL UNIQUE,
          value TEXT NOT NULL,
          keep INTEGER DEFAULT 0,
          PRIMARY KEY(id,key)
          );
        ''';
        await db.execute(kv);
        final scache = '''
          CREATE TABLE IF NOT EXISTS $_scache (
          id	INTEGER,
          key	TEXT NOT NULL UNIQUE,
          url	TEXT DEFAULT null,
          response	TEXT NOT NULL,
          PRIMARY KEY(id,key)
          );
        ''';
        await db.execute(scache);
        final error = '''
          CREATE TABLE IF NOT EXISTS $_error (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          code INTEGER NOT NULL,
          msg	TEXT,
          type INTEGER
          );
        ''';
        await db.execute(error);
      });
    }
  }

  closeDB() async {
    if (_db != null && _db.isOpen) {
      await _db.close();
    }
  }

  /// 清除缓存
  clearCache() {}

  /// 清除缓存
  /// 对缓存区分是否退出时删除
  logout() async {
    await openDB();
    await _db.execute('delete from $_kv where keep=0;');
    await _db.execute('delete from $_error;');
    await _db.execute('delete from $_scache;');
  }

  Future<String> dbPath() async {
    final dirPath = await getDatabasesPath();
    await Directory(dirPath).create(recursive: true);
    final dbPath = dirPath + (dirPath.endsWith('/') ? '.cache' : '/.cache');
    print('kvstorage path: ' + dbPath);
    return dbPath;
  }

  /// value是String|Map|Object
  /// objcet和Map会被转换为JsonString存储
  /// keep!=0 的字段在退出登录也不会被删除
  Future<void> setKeyAndValue(String key, dynamic value,
      {bool keepAlive = false}) async {
    await openDB();
    if (key == null) {
      return;
    }
    if (value == null) {
      _db.delete(_kv, where: "key='$key'");
    } else {
      String valueString;
      if (!(value is String)) {
        valueString = jsonEncode(value);
      } else {
        valueString = value;
      }
      final keepValue = keepAlive ? 1 : 0;
      final queryString =
          "replace into $_kv (key, value, keep) values ('$key', '$valueString', '$keepValue')";
      _db.execute(queryString);
    }
  }

  Future<String> getValue<T>(String key) async {
    await openDB();
    final result =
        await _db.rawQuery('select key, value from $_kv where key = \'$key\'');
    if (result.length == 0) {
      return null;
    } else {
      final first = result.first;
      return first['value'];
    }
  }
}
