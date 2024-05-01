part of 'app_widgets.dart';

class KdCardItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final bool selectedIndex;
  final Color? color;
  const KdCardItemWidget({
    super.key,
    required this.image,
    required this.title,
    this.selectedIndex = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: (selectedIndex) ? KdColors.primary70 : Colors.white,
          border: Border.all(
            color: (selectedIndex) ? KdColors.primary70 : KdColors.neutral50,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      (selectedIndex) ? KdColors.primary70 : KdColors.neutral30,
                ),
                borderRadius: BorderRadius.circular(20),
                color: (color != null) ? color : const Color(0xff6E00CE),
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: KdTextStyles.body1Medium.copyWith(
                color:
                    (selectedIndex) ? KdColors.neutral10 : KdColors.neutral90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
