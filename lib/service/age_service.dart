class AgeService {

  // int calculateAge(DateTime today, DateTime dob) {
  //   final year = today.year - dob.year;
  //   final mth = today.month - dob.month;
  //   if(mth < 0){
  //     return year-1;
  //   }
  //   else {
  //     return year;
  //   }
  // }

  // Function to calculate age based on date of birth
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  bool isAdultAge(DateTime birthdayDate) {
    int age = calculateAge(birthdayDate);
    // Check if the age is above 18
    if (age >= 18) {
      return true;
    } else {
      return false;
    }
  }

}