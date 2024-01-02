import 'package:isar/isar.dart';
part 'user.g.dart';

@collection
@Name("User")
class User {
  final Id userId = Isar.autoIncrement;
  late String name;
  @Index(unique: true, replace: true)
  late String phoneNumber;
  late String photoLink;
  late String photoSize;
  late String gender;
  late DateTime age;
  late String? profession;
  late String? education;
  late String? religion;
  late int? height;
  late String? smoking;
  late String? drinking;
  late String? mbti;
  late List<String>? contactList;
}

