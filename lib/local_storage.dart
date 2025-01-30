import 'package:get_it/get_it.dart';
import 'package:real_app/loggers.dart';
import 'package:real_app/r_helper.dart';
import 'package:sqflite/sqflite.dart';

Future<void> loadStorage(GetIt locator) async {
  const String dbName = "real_application.db";
  final String dbPath = await getDatabasesPath();
  final String dbLink = "$dbPath/$dbName";
  await preferences.reload();
  await CPreferences.dbLink.setString(dbLink);

  if (!await databaseFactory.databaseExists(dbLink)) {
    await openDatabase(dbLink, version: 1,
        onCreate: (Database db, int version) async {
      await createTblAppSettings(db);
      await createUserTable(db);
      await log(db, "Database Created!");
    });
  } else {
    Database db = await openDatabase(dbLink);
    await log(db, "Database Opened!");
  }

  return;
}

Future<void> createTblLogs(Database db) {
  return db.execute("""
    CREATE TABLE tbl_logs(
      id INTEGER PRIMARY KEY,
      employee_id INTEGER,
      message TEXT,
      type TEXT,
    );
  """);
}

Future<void> createTblAppSettings(Database db) {
  return db.execute("""
    CREATE TABLE tbl_app_settings(
      id INTEGER PRIMARY KEY,
      employee_id INTEGER,
      name TEXT,
      value TEXT,
      type TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  """);
}

Future<void> createUserTable(Database db) {
  return db.execute("""
    CREATE TABLE tbl_users(
      id INTEGER PRIMARY KEY,
      employee_id INTEGER,
      last_login TIMESTAMP,
      username TEXT,
      hashed_password TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  """);
}
