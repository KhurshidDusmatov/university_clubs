extension PhoneFormatter on String {
  String formatUzbekPhoneNumber() {
    if (length == 13 && startsWith('+998')) {
      return '${substring(0, 4)} ${substring(4, 6)} ${substring(6, 9)} ${substring(9, 11)} ${substring(11)}';
    } else {
      return "invalid number";
    }
  }
}