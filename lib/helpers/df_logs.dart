part of 'r_helper.dart';

enum LogType {
  info,
  warning,
  error,
}

Future<void> log(Database db, String message,
    {int employeeId = 0, LogType type = LogType.info}) {
  print(message);
  return db.insert('tbl_logs', {
    'employee_id': employeeId,
    'message': message.toString(),
    'type': type.toString(),
  });
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