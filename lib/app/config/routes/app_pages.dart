import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../../features/auth/modules/forgot_password/bindings/forgot_password_binding.dart';
import '../../features/auth/modules/forgot_password/views/forgot_password_view.dart';
import '../../features/auth/modules/login/bindings/login_binding.dart';
import '../../features/auth/modules/login/views/login_view.dart';
import '../../features/auth/modules/profile/bindings/profile_binding.dart';
import '../../features/auth/modules/profile/views/profile_view.dart';
import '../../features/auth/modules/register/bindings/register_binding.dart';
import '../../features/auth/modules/register/views/register_view.dart';
import '../../features/auth/modules/register_form/bindings/register_form_binding.dart';
import '../../features/auth/modules/register_form/views/register_form_view.dart';
import '../../features/auth/modules/register_otp/bindings/register_otp_binding.dart';
import '../../features/auth/modules/register_otp/views/register_otp_view.dart';
import '../../features/auth/modules/register_role/bindings/register_role_binding.dart';
import '../../features/auth/modules/register_role/views/register_role_view.dart';
import '../../features/auth/modules/register_verify/bindings/register_verify_binding.dart';
import '../../features/auth/modules/register_verify/views/register_verify_view.dart';
import '../../features/auth/modules/reset_password/bindings/reset_password_binding.dart';
import '../../features/auth/modules/reset_password/views/reset_password_view.dart';
import '../../features/initialize/change_language/bindings/change_language_binding.dart';
import '../../features/initialize/change_language/views/change_language_view.dart';
import '../../features/initialize/introduction/bindings/introduction_binding.dart';
import '../../features/initialize/introduction/views/introduction_view.dart';
import '../../features/initialize/welcome/bindings/welcome_binding.dart';
import '../../features/initialize/welcome/views/welcome_view.dart';
import '../../features/main/bindings/main_binding.dart';
import '../../features/main/modules/chatroom/bindings/chatroom_binding.dart';
import '../../features/main/modules/chatroom/views/chatroom_view.dart';
import '../../features/main/modules/conversation/bindings/conversation_binding.dart';
import '../../features/main/modules/conversation/views/conversation_view.dart';
import '../../features/main/modules/home/bindings/home_binding.dart';
import '../../features/main/modules/home/views/home_view.dart';
import '../../features/main/views/main_view.dart';
import '../../shared/widgets/app_widgets.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: HomeView(),
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: IntroductionView(),
      ),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: LoginView(),
      ),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_LANGUAGE,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: ChangeLanguageView(),
      ),
      binding: ChangeLanguageBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: WelcomeView(),
      ),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: RegisterView(),
      ),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_ROLE,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: RegisterRoleView(),
      ),
      binding: RegisterRoleBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_FORM,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: RegisterFormView(),
      ),
      binding: RegisterFormBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_VERIFY,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: RegisterVerifyView(),
      ),
      binding: RegisterVerifyBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_OTP,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: RegisterOtpView(),
      ),
      binding: RegisterOtpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: ForgotPasswordView(),
      ),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: ResetPasswordView(),
      ),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const KdBannerFlavor(
        show: kDebugMode,
        child: MainView(),
      ),
      binding: MainBinding(),
      children: [
        GetPage(
          name: _Paths.CONVERSATION,
          page: () => const KdBannerFlavor(
            show: kDebugMode,
            child: ConversationView(),
          ),
          binding: ConversationBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const KdBannerFlavor(
            show: kDebugMode,
            child: ProfileView(),
          ),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.CHATROOM,
          page: () => const KdBannerFlavor(
            show: kDebugMode,
            child: ChatroomView(),
          ),
          binding: ChatroomBinding(),
        ),
      ],
    ),
  ];
}
