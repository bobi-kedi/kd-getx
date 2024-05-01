part of 'app_widgets.dart';

class KdDialogWidget extends StatelessWidget {
  final String? title;
  final Widget? customTitle;
  final String? body;
  final Widget? customBody;
  final String? textBtn;
  final Function()? onPressed;
  final bool withButtonClose;
  const KdDialogWidget({
    super.key,
    this.title,
    this.customTitle,
    this.body,
    this.customBody,
    this.textBtn,
    this.onPressed,
    this.withButtonClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      contentPadding: withButtonClose
          ? const EdgeInsets.only(right: 8, top: 8)
          : EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Column(
          children: [
            if (withButtonClose)
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.highlight_remove),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 20,
                top: 32,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title != null || customTitle != null)
                    customTitle ??
                        Text(
                          title ?? 'Unknow Title',
                          style: KdTextStyles.body1Bold.copyWith(
                            color: KdColors.primary70,
                          ),
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                          ),
                          textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 20),
                  if (body != null || customBody != null)
                    customBody ??
                        Text(
                          body ?? 'Unknow Body',
                          style: KdTextStyles.body1Regular.copyWith(
                            color: KdColors.neutral70,
                          ),
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                          ),
                          textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 30),
                  if (textBtn != null)
                    SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: KdButtonWidget(
                          text: textBtn!,
                          buttonSizeType: ButtonSizeType.large,
                          onTapped: () {
                            if (onPressed != null) {
                              onPressed!();
                            }
                            Get.back();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
