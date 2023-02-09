import 'dart:core';

import 'package:get/get.dart';

import 'package:izinto/pages/home/main_specialty_page.dart';

class RouteHelper {
  static const String reSplashScreen = '/re-splash-screen';
  static const String splashScreen = '/splash-screen';
  static const String firstOnboard = '/first-onboard';
  static const String initial = '/';
  static const String recommendedSpecialties = '/recommended-specialties';
  static const String popularSpecialities = '/popular-specialties';
  static const String laundrySpecialties = '/laundry-specialties';
  static const String cartPage = '/cart-page';
  static const String cartHistory = '/cart-history';
  static const String signUpPage = '/sign_up';
  static const String signInPage = '/sign_in';
  static const String emailSignIn = '/email_sign_in';
  static const String phoneAuth = '/phone_auth';
  static const String mainPage = '/main_specialty_page';
  static const String recommendedSpecialtyGridView =
      '/recommended_specialty_grid_view';
  static const String locationSettings = '/location_settings';
  static const String profileSettings = '/profile_settings';

  static String getRecommendedSpecialtyGridView() =>
      recommendedSpecialtyGridView;
  static String getMainPage() => mainPage;
  static String getSignUp() => signUpPage;
  static String getSignIn() => signInPage;
  static String getEmailSignIn() => emailSignIn;
  static String getPhoneAuth() => phoneAuth;
  static String getReSplashScreen() => reSplashScreen;
  static String getSplashScreen() => splashScreen;
  static String getFirstOnboard() => firstOnboard;
  static String getInitial() => initial;
  static String getPopularSpecialties(int pageId, String page) =>
      '$popularSpecialities?pageId=$pageId&page=$page';
  static String getLaundrySpecialties(int pageId, String page) =>
      '$laundrySpecialties?pageId=$pageId&page=$page';
  static String getRecommendedSpecialities(int pageId, String page) =>
      '$recommendedSpecialties?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;
  static String getCartHistoryItems() => cartHistory;
  static String getLocationSetting() => locationSettings;
  static String getProfileSettings() => profileSettings;

  static List<GetPage> routes = [
    GetPage(
        name: mainPage,
        page: () {
          return const MainSpecialtyPage();
        }),
    // GetPage(
    //     name: recommendedSpecialtyGridView,
    //     page: () {
    //       return const RecommendedSpecialtyGridView();
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: phoneAuth,
    //     page: () {
    //       var phoneController;
    //       return PhoneAuth(phoneController.text);
    //     }),
    // GetPage(name: initial, page: () => const HomePage()),
    // GetPage(
    //   name: recommendedSpecialties,
    //   page: () {
    //     var pageId = Get.parameters['pageId'];
    //     var page = Get.parameters['page'];
    //     return RecommendedSpecialtyDetail(
    //         pageId: int.parse(pageId!), page: page!);
    //   },
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //     name: popularSpecialities,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       return PopularSpecialtyDetail(
    //           pageId: int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: cartPage,
    //     page: () {
    //       return CartPage();
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: cartHistory,
    //     page: () {
    //       return const CartHistoryItems();
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: laundrySpecialties,
    //     page: () {
    //       var pageId = Get.parameters['pageId'];
    //       var page = Get.parameters['page'];
    //       return LaundrySpecialtyDetail(
    //           pageId: int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: profileSettings,
    //     page: () {
    //       return const ProfileSettings();
    //     },
    //     transition: Transition.native),
  ];
}
