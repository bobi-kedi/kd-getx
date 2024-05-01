import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/app_styles.dart';

class FooterChatroom extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEmptyText;
  final Function(String)? onChanged;
  final Function()? onSendTapped;
  final Function()? onAudioTapped;
  const FooterChatroom({
    super.key,
    required this.controller,
    required this.focusNode,
    this.isEmptyText = true,
    this.onChanged,
    this.onSendTapped,
    this.onAudioTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: KdColors.primary10,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: KdColors.primary50,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: KdColors.primary90,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        focusNode: focusNode,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        controller: controller,
                        onChanged: onChanged,
                        style: KdTextStyles.body2Regular.copyWith(
                          color: KdColors.primary90,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tulis pesan...',
                          hintStyle: KdTextStyles.body2Regular.copyWith(
                            color: KdColors.neutral70,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (onSendTapped != null) {
                          onSendTapped!();
                        }
                      },
                      onLongPress: () {
                        if (onAudioTapped != null) {
                          onAudioTapped!();
                        }
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KdColors.primary50,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: (isEmptyText)
                              ? Center(
                                  key: ValueKey(isEmptyText),
                                  child: Icon(
                                    Icons.mic,
                                    color: KdColors.primary90,
                                  ),
                                )
                              : Center(
                                  key: ValueKey(isEmptyText),
                                  child: Icon(
                                    Icons.send_rounded,
                                    color: KdColors.primary90,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
