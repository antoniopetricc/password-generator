import 'dart:math';

String randomPassword({
  bool chars = true,
  bool numbers = true,
  bool specialChars = false,
  bool upperCase = false,
  int length = 16,
}) {
  String _chars = "abcdefghijklmnopqrstuvwxyz";
  String _charsUpper = _chars.toUpperCase();
  String _numbers = "0123456789";
  String _specialChars = "!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

  String _passwordChars = "";
  _passwordChars += chars ? _chars : "";
  _passwordChars += upperCase ? _charsUpper : "";
  _passwordChars += numbers ? _numbers : "";
  _passwordChars += specialChars ? _specialChars : "";

  String _password = "";

  for (int i = 0; i < length; i++) {
    int randomInt = Random.secure().nextInt(_passwordChars.length);
    _password += _passwordChars[randomInt];
  }

  return _password;
}
