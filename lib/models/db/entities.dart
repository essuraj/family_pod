import 'package:moor/moor.dart';

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(min: 1, max: 128)();
  TextColumn get gender => text().withLength(min: 1, max: 128).nullable()();
}

class MemberImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get memberId =>
      integer().customConstraint('NOT NULL REFERENCES members (id)')();
  TextColumn get image => text()();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
}

class Relationships extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get fromMember =>
      integer().customConstraint('NOT NULL REFERENCES members (id)')();
  IntColumn get toMember =>
      integer().customConstraint('NOT NULL REFERENCES members (id)')();
  TextColumn get relationName => text()();
}

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get memberId =>
      integer().customConstraint('NOT NULL REFERENCES members (id)')();
  TextColumn get eventName => text()();
  DateTimeColumn get date => dateTime().nullable()();
}
