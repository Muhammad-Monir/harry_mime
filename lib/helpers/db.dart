import 'package:harry_mine/services/dao_init.dart';
import 'package:sqflite/sqflite.dart';

class DbUtil {
  // Future<int> saveData(String table, Map<String, Object?> data) =>
  //     DbSingleton.instance.db
  //         .insert(table, data, conflictAlgorithm: ConflictAlgorithm.fail);
  Future<int> saveData(String table, Map<String, Object?> data) =>
      DbSingleton.instance.db
          .insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);

  Future<List<Map<String, dynamic>>> getAllData(String table,
          [int? limit, int? offset]) =>
      DbSingleton.instance.db.query(table, limit: limit, offset: offset);

  Future<List<Map<String, dynamic>>> getDataByID(
          {required String table, required String where, required String id}) =>
      DbSingleton.instance.db.query(table, where: where, whereArgs: [id]);

  Future<List<Map<String, dynamic>>> queryString(String query) =>
      DbSingleton.instance.db.rawQuery(query);

  Future<int> deleteData(
          {required String table, required String where, required String id}) =>
      DbSingleton.instance.db.delete(table, where: where, whereArgs: [id]);

  Future<void> insertBatchData(
          {required String table, required List<dynamic> entities}) =>
      DbSingleton.instance.db.transaction(
        (txn) async {
          for (final entity in entities) {
            txn.insert(table, entity.toJson(),
                conflictAlgorithm: ConflictAlgorithm.replace);
          }
        },
      );
}
