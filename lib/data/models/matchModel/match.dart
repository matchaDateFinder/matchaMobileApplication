import 'package:isar/isar.dart';
part 'match.g.dart';

@collection
@Name("Match")
class Match {
  final Id matchId = Isar.autoIncrement;
  late String user1Name;
  late String user1PhoneNumber;
  late String user2Name;
  late String user2PhoneNumber;
  late bool? user1Reaction;
  late bool? user2Reaction;
  late bool? isVisitedByUser1;
  late bool? isVisitedByUser2;
}