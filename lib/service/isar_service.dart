import 'package:isar/isar.dart';

import 'package:matchaapplication/data/models/chatModel/chat.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
import 'package:matchaapplication/data/models/matchModel/match.dart';

import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService(){
    db = openDB();
  }

  Future<void> saveUser(User newUser) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.users.putSync(newUser));
  }

  Future<User?> getUserByPhoneNumber(String phoneNumber) async {
    final isar = await db;
    return await isar.users.
    filter().
    phoneNumberMatches(phoneNumber).
    findFirst();
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ChatSchema, UserSchema, MatchSchema],
        inspector: true,
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }
}