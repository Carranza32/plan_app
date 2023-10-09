import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:plan_app/src/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
	static const _databaseName = 'plan_app.db';
	static const _databaseVersion = 1;

	static Database? _dataBase;
	static final DBProvider db = DBProvider._();
	DBProvider._();

	Future<Database?> get database async{
		if(_dataBase != null) return _dataBase;

		_dataBase = await initDB();
		return _dataBase;
  	}

  	Future<Database> initDB() async{
      Database db;

      //getPath database
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      final path = join(documentDirectory.path, _databaseName);

      print("DB Location: " + path);

      //Crear db
      db = await openDatabase(
        path,
        version: _databaseVersion,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('''
              CREATE TABLE IF NOT EXISTS user (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                llave_api TEXT,
                nombre TEXT,
                email TEXT
              );
          ''');

          await db.execute('''
              CREATE TABLE IF NOT EXISTS form (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                vinificacion TEXT,
                diametro TEXT,
                plaguicida INTEGER,
                dosis TEXT,
                fechaAplicacion TEXT,
                so TEXT
              );
          ''');
          
          await db.execute('''
              CREATE TABLE IF NOT EXISTS plaguicidas (
                id TEXT,
                plaguicida TEXT,
                k TEXT,
                ftt TEXT,
                ftb TEXT
              );
          ''');

      await db.execute('''
              CREATE TABLE IF NOT EXISTS last_plaguicidas_updated (
          updated_at DATETIME
              );
          ''');
        }
      );

    return db;
  }

	Future<int?> insertUser(UserModel model) async{
		final db = await database;
		final res = await db?.insert('user', model.toJson());
		//regresa el id del ultimo producto
		return res;
   }

	Future<UserModel?> getUser() async {
		final db = await database;
		final res = await db?.query('user');
    print(res!);

		return res.isNotEmpty ? UserModel.fromJson(res.first) : null;
	}

	Future<int> updateUser(UserModel model) async {
		final db = await database;
		final res = await db!.update('user', model.toJson(), where: 'id = ?', whereArgs: [model.id]);

		return res;
	}

  Future<int> deleteUser() async {
		final db  = await database;
		final res = await db!.rawDelete('DELETE FROM user');
		return res;
	}

	Future<int> deleteAllPlagicidas() async {
		final db = await database;
		final res = await db!.rawDelete('DELETE FROM plaguicidas');

		return res;
	}

	// Future<List<Plaguicida>?> getAllPlagicidas() async {
	// 	final db = await database;
	// 	final res = await db!.query('plaguicidas');

	// 	return res.isNotEmpty 
	// 		? res.map((s) => Plaguicida.fromJson(s)).toList() 
	// 		: null;
	// }

	// Future<DateTime> getLastPlaguicidasUpdated() async {
	// 	final db = await database;
	// 	final res = await db!.query('last_plaguicidas_updated');

	// 	return res.isNotEmpty ? DateTime.parse(res.first['updated_at'].toString()) : DateTime.now();
	// }

	// Future<int> updateLastPlaguicidasUpdated() async {
	// 	final db = await database;
	// 	final res = await db!.rawUpdate('UPDATE last_plaguicidas_updated SET updated_at = ?', [DateTime.now().toString()]);

	// 	return res;
	// }
}