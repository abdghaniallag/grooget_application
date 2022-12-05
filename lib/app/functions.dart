import 'dart:developer';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String getCookie(String responseCookie) {
  return responseCookie.substring(
      responseCookie.indexOf("-"), responseCookie.indexOf(";"));
}

String splitCombinationCode(String code, bool isColor) {
 
  return isColor
      ? code.substring(0,code.indexOf('_'))
      : code.substring( code.indexOf('_')+1);

}
