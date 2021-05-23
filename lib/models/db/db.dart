import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';
import 'package:family_pod/models/db/entities.dart';
// import 'package:sqflite/sqflite.dart' show getDatabasesPath;

part 'db.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
    // final dbFolder = await getDatabasesPath();
    // final file = File(p.join(dbFolder, 'db.sqlite'));
    // return VmDatabase(file);
  });
}

@UseMoor(tables: [Members])
class DB extends _$DB {
  // we tell the database where to store the data with this constructor
  DB() : super(_openConnection());

  Future<int> addAFamilyMember(MembersCompanion member) {
    return into(members).insert(member);
  }

  Future<List<Member>> getFamilyMembers() {
    return select(members).get();
  }

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}
