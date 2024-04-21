bool isValidString(String? str) {
  return str != null &&
      str.toString().trim().isNotEmpty &&
      str.toString().trim() != "null";
}

abstract class Validator {
  bool isValid();
}


class StringValidator extends Validator {
  String? text;
  StringValidator({this.text});

  @override
  bool isValid() {
    return isValidString(text);
  }
}


// class LocationValidator extends Validator {
//   LocationEntity? location;
//   LocationValidator({this.location});

//   @override
//   bool isValid() {
//     if (location == null) {
//       return false;
//     }
//     if (location?.latitude == null || location!.longitude == null) {
//       return false;
//     }
//     return true;
//   }
// }


