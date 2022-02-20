// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:code_manage_test/app/models/local_movie_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper.internal();
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String DATABASE_NAME = 'movie.db';
  final int DATABASE_VERSION = 3;

  final String POPULAR_TABLE = 'popular_table';
  final String UPCOMMING_TABLE = 'upcomming_table';

  final String ID = 'id';
  final String POSTER_PATH = 'posterPath';
  final String TITLE = 'title';
  final String OVERVIEW = 'overview';
  final String FAVOURITE = 'favourite';

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, DATABASE_NAME);

    var createdDatabase = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);
    return createdDatabase;
  }

  Future<void> _onCreate(Database db, int version) async {
    String createPopularTable =
        "CREATE TABLE $POPULAR_TABLE($ID INTEGER PRIMARY KEY, $POSTER_PATH TEXT, $TITLE TEXT, $OVERVIEW TEXT, $FAVOURITE INTEGER)";
    await db.execute(createPopularTable);
    String createUpcommingTable =
        "CREATE TABLE $UPCOMMING_TABLE($ID INTEGER PRIMARY KEY, $POSTER_PATH TEXT, $TITLE TEXT, $OVERVIEW TEXT, $FAVOURITE INTEGER)";
    await db.execute(createUpcommingTable);
  }

  Future<int> getDataCount(String tableName) async {
    var dbClient = await database;
    String sql = "SELECT COUNT(*) FROM $tableName";
    var result = await dbClient.rawQuery(sql);
    int? count = Sqflite.firstIntValue(result);
    return count ?? 0;
  }

  Future<List<LocalMovie>> getData(String tableName) async {
    var dbClient = await database;
    String sql = "SELECT * FROM $tableName ORDER BY $ID ASC";
    var result = await dbClient.rawQuery(sql);
    return result.map((movie) => LocalMovie.fromMap(movie)).toList();
  }

  Future<int> addData(LocalMovie localMovie, String tableName) async {
    var dbClient = await database;
    int result = await dbClient.insert(tableName, localMovie.toMap());
    print('Add Data=> $result');
    return result;
  }

  Future<int> updateData(int favourite, int id, String tableName) async {
    var dbClient = await database;
    String sql =
        "UPDATE $tableName SET $FAVOURITE = $favourite WHERE $ID = $id";
    var result = await dbClient.rawQuery(sql);
    if (result != null) {
      return 1;
    } else {
      return 0;
    }
  }

  // Future<int> deleteData(int id, String tableName) async {
  //   var dbClient = await database;
  //   var result = dbClient.delete(tableName, where: "$ID = ? ", whereArgs: [id]);
  //   return result;
  // }

  // Future<int> deleteAllData(String tableName) async {
  //   var dbClient = await database;
  //   var result = dbClient.delete(tableName);
  //   return result;
  // }

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }
}
