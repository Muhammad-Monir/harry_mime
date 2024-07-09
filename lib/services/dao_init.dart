import 'package:harry_mine/constants/table_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// import '../../constants/db_table_constants.dart';

final class DbSingleton {
  static final DbSingleton _singleton = DbSingleton._internal();
  DbSingleton._internal();
  static DbSingleton get instance => _singleton;

  static const databaseVersion = 1;
  static const _databaseName = 'com.harrymine.app';
  late Database db;

  Future<Database> create() async {
    db = await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createBusinessTableV1(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
    return db;
  }

  void _createBusinessTableV1(Batch batch) {
    batch.execute('''
       create TABLE ${TableConstant.kSaveTableName}
       (
       ${TableConstant.kId} TEXT PRIMARY KEY,
       ${TableConstant.kCategoryId} TEXT,
       ${TableConstant.kname} TEXT,
       ${TableConstant.kcapital} TEXT,
       ${TableConstant.kSkills} TEXT,
       ${TableConstant.kNecessaryPeople} TEXT
       )
       ''');
    // batch.execute('''
    //    create TABLE  ${TableConst.kPostsTableName}
    //    (
    //     ${TableConst.kId} TEXT PRIMARY KEY,
    //     ${TableConst.kUrl} TEXT, 
    //     ${TableConst.kTitle} TEXT,
    //     ${TableConst.kContent} TEXT,
    //     ${TableConst.kImage} TEXT,
    //     ${TableConst.kThumbnail} TEXT,
    //     ${TableConst.kUserId} TEXT
    //    )
    //    ''');
  }
}
