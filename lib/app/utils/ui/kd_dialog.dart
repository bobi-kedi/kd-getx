part of 'app_ui.dart';

class KdDialog {
  static Future<void> dialogButton(
    BuildContext context, {
    String? title,
    String? body,
    String? textBtn,
    Widget? customTitle,
    Widget? customBody,
    dynamic onPressed,
    bool withButtonClose = false,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) => KdDialogWidget(
        title: title,
        customTitle: customTitle,
        withButtonClose: withButtonClose,
        body: body,
        customBody: customBody,
        textBtn: textBtn,
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
      ),
    );
  }

  static Future<void> loading(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) => const KdAlertDialogWidget(),
    );
  }
}
