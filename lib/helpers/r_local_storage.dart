import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

Future<HydratedStorage> loadStorage(GetIt locator) async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  
  if (kIsWeb) {
    return HydratedStorage.build(
        storageDirectory: HydratedStorage.webStorageDirectory);
  } else {
    return HydratedStorage.build(
      storageDirectory: (await getApplicationDocumentsDirectory()),
    );
  }
}
