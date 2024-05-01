part of 'app_services.dart';

class NativeApiServices {
  static final NativeApiServices _nativeApiServices =
      NativeApiServices._internal();

  factory NativeApiServices() {
    return _nativeApiServices;
  }
  NativeApiServices._internal();

  // Example
  // final _imagePicker = ImagePicker();
  // Future<File?> getImage(ImageSource source,
  //     {int maxHeight = 800, int maxWidth = 800}) async {
  //   final image = await _imagePicker.pickImage(
  //       source: source,
  //       maxHeight: maxHeight.toDouble(),
  //       maxWidth: maxWidth.toDouble());

  //   if (image != null) return File(image.path);
  //   return null;
  // }

  Future<PackageInfo> getInfoDevice() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}
