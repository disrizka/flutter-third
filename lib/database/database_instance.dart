// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:thirdd/database/identitas_model.dart';

// class DatabaseInstance {
//   final String _databaseName = 'my_database.db';
//   final int _databaseVersion = 1;

//   // table identitas
//   final String table = "identitas";
//   final String id = "id";
//   final String name = "name";
//   final String email = "email";
//   final String telepon = "telepon";
//   final String createdAt = "created_at";
//   final String updatedAt = "updated_at";

//   Database? _database;
//   Future<Database> database() async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future _initDatabase() async {
//     Directory documentdDirectory = await getApplicationCacheDirectory();
//     String path = join(documentdDirectory.path, _databaseName);
//     return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $name TEXT NULL, $email TEXT NULL, $telepon TEXT NULL, $createdAt TEXT NULL, $updatedAt TEXT NULL)',
//     );
//   }

//   Future<List<IdentitasModel>> all() async {
//     final data = await _database!.query(table);
//     List<IdentitasModel> result =
//         data.map((e) => IdentitasModel.fromJson(e)).toList();
//     print(result);
//     return result;
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     final query = _database!.insert(table, row);
//     return query;
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:thirdd/database/identitas_model.dart';

class DatabaseInstance {
  final String _databaseName = 'my_database.db';
  final int _databaseVersion = 1;

  final String table = "identitas";
  final String id = "id";
  final String name = "name";
  final String email = "email";
  final String telepon = "telepon";
  final String createdAt = "created_at";
  final String updatedAt = "updated_at";

  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table ($id INTEGER PRIMARY KEY, $name TEXT, $email TEXT, $telepon TEXT, $createdAt TEXT, $updatedAt TEXT)
      ''');
  }

  Future<List<IdentitasModel>> all() async {
    final db = await database();
    final data = await db.query(table);
    return data.map((e) => IdentitasModel.fromJson(e)).toList();
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database();
    return await db.insert(table, row);
  }
}
