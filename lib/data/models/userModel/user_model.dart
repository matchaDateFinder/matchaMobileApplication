
class User {

  final String name;
  final String phoneNumber;
  final String photoLink;
  final String photoSize;
  final String gender;
  final DateTime age;
  final String? profession;
  final String? education;
  final String? religion;
  final int? height;
  final String? smoking;
  final String? drinking;
  final String? mbti;
  final List<String>? contactList;

  User({
      required this.name,
      required this.phoneNumber,
      required this.photoLink,
      required this.photoSize,
      required this.gender,
      required this.age,
      this.profession,
      this.education,
      this.religion,
      this.height,
      this.smoking,
      this.drinking,
      this.mbti,
      this.contactList
  });

}