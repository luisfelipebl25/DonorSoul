bool stateValid(value) {
  return value != null;
}

bool emailValid(String email) {
  final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
  return regex.hasMatch(email);
}

bool nameComplete(String name) {
  return name.trim().split(' ').length > 1;
}

bool passwordValid(String pass) {
  return pass.length >= 6;
}

bool nameInstitutionValid(String name) {
  return name.trim().isNotEmpty && name.isNotEmpty && name.trim().length >= 3;
}

bool nameAddressValid(String address) {
  return address.trim().isNotEmpty &&
      address.isNotEmpty &&
      address.trim().length >= 8;
}

bool cepValid(String cep) {
  String _cep = cep.replaceAll(RegExp(r'[^0-9]'), '');
  return _cep.length == 8;
}

bool nameCityValid(String city) {
  return city.trim().isNotEmpty && city.isNotEmpty && city.trim().length >= 5;
}

bool numberValid(String phone) {
  String _phone = phone.replaceAll(RegExp(r'[^0-9]'), '');
  return _phone.length == 11;
}

bool descriptionValid(String description) {
  return description.trim().isNotEmpty &&
      description.isNotEmpty &&
      description.trim().length >= 30;
}

bool itemValid(String item) {
  return item.trim().isNotEmpty && item.isNotEmpty && item.trim().length >= 3;
}
