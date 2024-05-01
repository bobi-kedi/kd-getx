import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../shared/styles/app_styles.dart';
import '../../../../../shared/widgets/app_widgets.dart';
import '../../../../../utils/helper/app_helper.dart';
import '../controllers/register_verify_controller.dart';

class RegisterVerifyView extends GetView<RegisterVerifyController> {
  const RegisterVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Akun',
          style: KdTextStyles.heading5SemiBold
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: KdColors.primary10,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: KdColors.primary70,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55, top: 80),
                child: Text(
                  'Kita akan kirimkan Anda kode Verifikasi',
                  style: KdTextStyles.body1Medium.copyWith(
                    color: KdColors.neutral90,
                  ),
                ),
              ),
              Obx(
                () => OptionItem(
                  selectedIndex: controller.selectedIndex.value,
                  isSelected: (controller.selectedIndex.value == 1),
                  value: 1,
                  title: 'Email',
                  description: controller.email.value,
                  onChanged: (value) {
                    controller.selectedIndex.value = value!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => OptionItem(
                  selectedIndex: controller.selectedIndex.value,
                  isSelected: (controller.selectedIndex.value == 2),
                  value: 2,
                  title: 'SMS',
                  description: controller.phone.value,
                  onChanged: (value) {
                    controller.selectedIndex.value = value!;
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: KdButtonWidget(
                    text: 'Kirim',
                    buttonSizeType: ButtonSizeType.large,
                    onTapped: () {
                      controller.navigationNext();
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final int value;
  final bool isSelected;
  final int selectedIndex;
  final String title;
  final String? description;
  final Function(int?)? onChanged;
  const OptionItem({
    super.key,
    required this.value,
    required this.isSelected,
    required this.selectedIndex,
    required this.title,
    required this.onChanged,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          onChanged!(value);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: (isSelected)
                  ? KdColors.primary70
                  : KdColors.neutral70.withOpacity(0.7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return KdColors.primary70;
                        }
                        return KdColors.neutral70.withOpacity(0.7);
                      },
                    ),
                    value: value,
                    groupValue: selectedIndex,
                    onChanged: onChanged,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: KdTextStyles.body1Regular.copyWith(
                        color: KdColors.neutral90,
                      ),
                    ),
                    if (description != null)
                      Text(
                        '$description',
                        style: KdTextStyles.body2Regular.copyWith(
                          color: KdColors.neutral70,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
