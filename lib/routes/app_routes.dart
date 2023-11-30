import 'package:healhio/presentation/splash_screen/splash_screen.dart';
import 'package:healhio/presentation/splash_screen/binding/splash_binding.dart';
import 'package:healhio/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:healhio/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:healhio/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:healhio/presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import 'package:healhio/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:healhio/presentation/onboarding_three_screen/binding/onboarding_three_binding.dart';
import 'package:healhio/presentation/onboarding_four_screen/onboarding_four_screen.dart';
import 'package:healhio/presentation/onboarding_four_screen/binding/onboarding_four_binding.dart';
import 'package:healhio/presentation/login_screen/login_screen.dart';
import 'package:healhio/presentation/login_screen/binding/login_binding.dart';
import 'package:healhio/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:healhio/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:healhio/presentation/reset_password_email_tab_container_screen/reset_password_email_tab_container_screen.dart';
import 'package:healhio/presentation/reset_password_email_tab_container_screen/binding/reset_password_email_tab_container_binding.dart';
import 'package:healhio/presentation/reset_password_verify_code_screen/reset_password_verify_code_screen.dart';
import 'package:healhio/presentation/reset_password_verify_code_screen/binding/reset_password_verify_code_binding.dart';
import 'package:healhio/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:healhio/presentation/create_new_password_screen/binding/create_new_password_binding.dart';
import 'package:healhio/presentation/home_container_screen/home_container_screen.dart';
import 'package:healhio/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:healhio/presentation/top_doctor_screen/top_doctor_screen.dart';
import 'package:healhio/presentation/top_doctor_screen/binding/top_doctor_binding.dart';
import 'package:healhio/presentation/find_doctors_screen/find_doctors_screen.dart';
import 'package:healhio/presentation/find_doctors_screen/binding/find_doctors_binding.dart';
import 'package:healhio/presentation/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:healhio/presentation/doctor_detail_screen/binding/doctor_detail_binding.dart';
import 'package:healhio/presentation/booking_doctor_screen/booking_doctor_screen.dart';
import 'package:healhio/presentation/booking_doctor_screen/binding/booking_doctor_binding.dart';
import 'package:healhio/presentation/chat_with_doctor_screen/chat_with_doctor_screen.dart';
import 'package:healhio/presentation/chat_with_doctor_screen/binding/chat_with_doctor_binding.dart';
import 'package:healhio/presentation/audio_call_screen/audio_call_screen.dart';
import 'package:healhio/presentation/audio_call_screen/binding/audio_call_binding.dart';
import 'package:healhio/presentation/video_call_screen/video_call_screen.dart';
import 'package:healhio/presentation/video_call_screen/binding/video_call_binding.dart';
import 'package:healhio/presentation/articles_screen/articles_screen.dart';
import 'package:healhio/presentation/articles_screen/binding/articles_binding.dart';
import 'package:healhio/presentation/pharmacy_screen/pharmacy_screen.dart';
import 'package:healhio/presentation/pharmacy_screen/binding/pharmacy_binding.dart';
import 'package:healhio/presentation/drugs_detail_screen/drugs_detail_screen.dart';
import 'package:healhio/presentation/drugs_detail_screen/binding/drugs_detail_binding.dart';
import 'package:healhio/presentation/my_cart_screen/my_cart_screen.dart';
import 'package:healhio/presentation/my_cart_screen/binding/my_cart_binding.dart';
import 'package:healhio/presentation/location_screen/location_screen.dart';
import 'package:healhio/presentation/location_screen/binding/location_binding.dart';
import 'package:healhio/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:healhio/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String onboardingFourScreen = '/onboarding_four_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String resetPasswordEmailPage = '/reset_password_email_page';

  static const String resetPasswordEmailTabContainerScreen =
      '/reset_password_email_tab_container_screen';

  static const String resetPasswordPhonePage = '/reset_password_phone_page';

  static const String resetPasswordVerifyCodeScreen =
      '/reset_password_verify_code_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String topDoctorScreen = '/top_doctor_screen';

  static const String findDoctorsScreen = '/find_doctors_screen';

  static const String doctorDetailScreen = '/doctor_detail_screen';

  static const String bookingDoctorScreen = '/booking_doctor_screen';

  static const String chatWithDoctorScreen = '/chat_with_doctor_screen';

  static const String audioCallScreen = '/audio_call_screen';

  static const String videoCallScreen = '/video_call_screen';

  static const String schedulePage = '/schedule_page';

  static const String scheduleTabContainerPage = '/schedule_tab_container_page';

  static const String messageHistoryPage = '/message_history_page';

  static const String messageHistoryTabContainerPage =
      '/message_history_tab_container_page';

  static const String articlesScreen = '/articles_screen';

  static const String pharmacyScreen = '/pharmacy_screen';

  static const String drugsDetailScreen = '/drugs_detail_screen';

  static const String myCartScreen = '/my_cart_screen';

  static const String locationScreen = '/location_screen';

  static const String profilePage = '/profile_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingThreeScreen,
      page: () => OnboardingThreeScreen(),
      bindings: [
        OnboardingThreeBinding(),
      ],
    ),
    GetPage(
      name: onboardingFourScreen,
      page: () => OnboardingFourScreen(),
      bindings: [
        OnboardingFourBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordEmailTabContainerScreen,
      page: () => ResetPasswordEmailTabContainerScreen(),
      bindings: [
        ResetPasswordEmailTabContainerBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordVerifyCodeScreen,
      page: () => ResetPasswordVerifyCodeScreen(),
      bindings: [
        ResetPasswordVerifyCodeBinding(),
      ],
    ),
    GetPage(
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
      bindings: [
        CreateNewPasswordBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: topDoctorScreen,
      page: () => TopDoctorScreen(),
      bindings: [
        TopDoctorBinding(),
      ],
    ),
    GetPage(
      name: findDoctorsScreen,
      page: () => FindDoctorsScreen(),
      bindings: [
        FindDoctorsBinding(),
      ],
    ),
    GetPage(
      name: doctorDetailScreen,
      page: () => DoctorDetailScreen(),
      bindings: [
        DoctorDetailBinding(),
      ],
    ),
    GetPage(
      name: bookingDoctorScreen,
      page: () => BookingDoctorScreen(),
      bindings: [
        BookingDoctorBinding(),
      ],
    ),
    GetPage(
      name: chatWithDoctorScreen,
      page: () => ChatWithDoctorScreen(),
      bindings: [
        ChatWithDoctorBinding(),
      ],
    ),
    GetPage(
      name: audioCallScreen,
      page: () => AudioCallScreen(),
      bindings: [
        AudioCallBinding(),
      ],
    ),
    GetPage(
      name: videoCallScreen,
      page: () => VideoCallScreen(),
      bindings: [
        VideoCallBinding(),
      ],
    ),
    GetPage(
      name: articlesScreen,
      page: () => ArticlesScreen(),
      bindings: [
        ArticlesBinding(),
      ],
    ),
    GetPage(
      name: pharmacyScreen,
      page: () => PharmacyScreen(),
      bindings: [
        PharmacyBinding(),
      ],
    ),
    GetPage(
      name: drugsDetailScreen,
      page: () => DrugsDetailScreen(),
      bindings: [
        DrugsDetailBinding(),
      ],
    ),
    GetPage(
      name: myCartScreen,
      page: () => MyCartScreen(),
      bindings: [
        MyCartBinding(),
      ],
    ),
    GetPage(
      name: locationScreen,
      page: () => LocationScreen(),
      bindings: [
        LocationBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
