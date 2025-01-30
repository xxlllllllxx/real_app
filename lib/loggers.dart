import 'package:real_app/r_helper.dart';
import 'package:sqflite/sqflite.dart';

Future<void> log(Database db, String message,
    {int employeeId = 0, LogType type = LogType.info}) {
  return db.insert('tbl_logs', {
    'employee_id': employeeId,
    'message': message.toString(),
    'type': type.toString(),
  });
}