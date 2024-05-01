part of 'kd_message.dart';

class KdTextMessage extends StatelessWidget {
  final String message;
  final String messageAt;
  final bool isMe;
  const KdTextMessage({
    super.key,
    required this.message,
    required this.messageAt,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: (isMe) ? 16 : 50, left: (isMe) ? 50 : 16, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  (isMe) ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (isMe) ? KdColors.primary70 : KdColors.neutral10,
                      borderRadius: (isMe)
                          ? const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            message,
                            style: KdTextStyles.body3Regular.copyWith(
                              color: (isMe)
                                  ? KdColors.neutral10
                                  : KdColors.neutral90,
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              if (isMe)
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.done_all_rounded,
                                      size: 12,
                                      color: (isMe)
                                          ? KdColors.primary10
                                          : KdColors.neutral50,
                                    ),
                                  ),
                                ),
                              TextSpan(
                                text: messageAt,
                                style: KdTextStyles.caption2Regular.copyWith(
                                  color: (isMe)
                                      ? KdColors.primary10
                                      : KdColors.neutral50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
