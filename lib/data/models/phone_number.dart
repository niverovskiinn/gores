class PhoneNumber {
  String? countryISOCode;
  String? countryCode;
  String? number;

  PhoneNumber(
    this.countryISOCode,
    this.countryCode,
    this.number,
  );

  String get completeNumber {
    return countryCode! + number!;
  }
}
