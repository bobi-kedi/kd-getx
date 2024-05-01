part of 'app_widgets.dart';

class KdFormInputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FormInputType? formInputType;
  final Function(String) onSaved;
  final String? Function(String?)? validator;
  final Function()? onShowPassword;
  final String? requireLabel;
  final bool showErrorText;
  final bool obscureText;
  const KdFormInputWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.onSaved,
    this.controller,
    this.formInputType = FormInputType.text,
    this.onShowPassword,
    this.validator,
    this.requireLabel,
    this.showErrorText = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    switch (formInputType) {
      case FormInputType.email:
        return EmailInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          onSaved: onSaved,
          validator: validator,
          requireLabel: requireLabel,
          showErrorText: showErrorText,
        );
      case FormInputType.number:
        return NumberInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          onSaved: onSaved,
          validator: validator,
          requireLabel: requireLabel,
        );
      case FormInputType.phone:
        return PhoneInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          onSaved: onSaved,
          validator: validator,
          requireLabel: requireLabel,
        );
      case FormInputType.password:
        return PasswordInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          onSaved: onSaved,
          validator: validator,
          requireLabel: requireLabel,
          onShowPassword: onShowPassword,
          obscureText: obscureText,
        );
      default:
        return TextInputFieldWidget(
          controller: controller,
          label: label,
          hintText: hintText,
          onSaved: onSaved,
          validator: validator,
          requireLabel: requireLabel,
        );
    }
  }
}
