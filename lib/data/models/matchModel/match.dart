import 'package:isar/isar.dart';
part 'match.g.dart';

@collection
@Name("Match")
class Match {
  final Id matchId = Isar.autoIncrement;
  late int user1Id; // depends on the perspective, may be the initiator match initiator or not
  late int user2Id; // depends on the perspective, may be the initiator match initiator or not
  late String user1Reaction; // like or not like from user 1
  late String user2Reaction; // like or not like from user 2
  late bool isVisited;
}