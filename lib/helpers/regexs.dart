String onlyNumbers(String number){
  String num = number.replaceAll(RegExp(r'[^0-9]'), '');
  return num;
}