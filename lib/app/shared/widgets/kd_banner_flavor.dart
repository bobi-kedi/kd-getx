part of 'app_widgets.dart';

class KdBannerFlavor extends StatelessWidget {
  final Widget child;
  final bool show;
  const KdBannerFlavor({
    super.key,
    required this.child,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topEnd,
            message: F.name,
            color: (F.appFlavor == Flavor.dev)
                ? KdColors.error70
                : (F.appFlavor == Flavor.stg)
                    ? KdColors.warning70
                    : KdColors.success70,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
              letterSpacing: 1.0,
            ),
            textDirection: TextDirection.ltr,
            child: child,
          )
        : Container(
            child: child,
          );
  }
}
