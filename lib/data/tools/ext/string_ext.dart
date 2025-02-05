extension PhoneFormatter on String {
  String formatUzbekPhoneNumber() {
    if (length == 13 && startsWith('+998')) {
      return '${substring(0, 4)} ${substring(4, 6)} ${substring(6, 9)} ${substring(9, 11)} ${substring(11)}';
    } else {
      return "invalid number";
    }
  }
}

extension PhoneFormatter2 on String {
  String toUzbFormat() {
    if (length != 9) return this;
    return "+998 ${substring(0, 2)} ${substring(2, 5)} ${substring(5, 7)} ${substring(7, 9)}";
  }
}

