import 'package:isar/isar.dart';

import 'package:matchaapplication/data/models/chatModel/chat.dart';
import 'package:matchaapplication/data/models/chatModel/chatRoom.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
import 'package:matchaapplication/data/models/matchModel/match.dart';

import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService(){
    db = openDB();
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ChatSchema, ChatRoomSchema, UserModelSchema, MatchSchema],
        inspector: true,
        directory: dir.path
      );
    }
    return Future.value(Isar.getInstance());
  }


  // Future<void> saveUser(UserModel newUser) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.userModels.putSync(newUser));
  // }
  //
  // Future<UserModel?> getUserByPhoneNumber(String phoneNumber) async {
  //   final isar = await db;
  //   return await isar.userModels.
  //   filter().
  //   phoneNumberMatches(phoneNumber).
  //   findFirst();
  // }
  //
  // Future<String> getPhoneNumberInIsarDB() async {
  //   final isar = await db;
  //   List<UserModel> user = await isar.userModels.where().findAll();
  //   return user[0].phoneNumber;
  // }
  //
  // Future<void> clearAllDataFromIsarDB() async {
  //   // TODO
  //   final isar = await db;
  //   await isar.writeTxn(() async {
  //     await isar.userModels.clear();
  //     await isar.matchs.clear();
  //     await isar.chats.clear();
  //     await isar.chatRooms.clear();
  //   });
  // }
  //
  // Future<void> createNewChatRoom(ChatRoom chatRoom) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.chatRooms.putSync(chatRoom));
  // }

}