import 'package:moor/moor.dart';

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(min: 1, max: 128)();
  TextColumn get gender => text().withLength(min: 1, max: 128).nullable()();
}
