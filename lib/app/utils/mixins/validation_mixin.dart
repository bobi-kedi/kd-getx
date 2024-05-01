part of 'app_mixins.dart';

mixin ValidatorMixin {
  // example :
  // String? validateTextFieldIsRequired(String? value) {
  //   if (value == null || value.trim().isEmpty) return "this field is required";
  //   return null;
  // }

  // String? validateDropdownIsRequired(String? value) {
  //   if (value == null || value.trim().isEmpty) return "please select item";
  //   return null;
  // }

  String? validateEmailRequired(String? value) {
    String regEx =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(regEx).hasMatch(value!) ? null : 'Enter a valid Email';
  }
}
