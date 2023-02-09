import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:izinto/controllers/cart_controller.dart';
import 'package:izinto/controllers/laundry_specialty_controller.dart';
import 'package:izinto/controllers/recommended_specialty_controller.dart';
import 'package:izinto/helpers/data/api/api_client.dart';
import 'package:izinto/helpers/data/repository/cart_repo.dart';
import 'package:izinto/helpers/data/repository/laundry_specialty_repo.dart';
import 'package:izinto/helpers/data/repository/recommended_specialty_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/popular_specialty_controller.dart';
import '../utils/app_constants.dart';
import 'data/repository/popular_specialty_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //This is our ApiClient
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //This will get our repositories
  Get.lazyPut(() => PopularSpecialtyRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedSpecialtyRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => LaundrySpecialtyRepo(apiClient: Get.find()));

  //controllers

  Get.lazyPut(() =>
      RecommendedSpecialtyController(recommendedSpecialtyRepo: Get.find()));
  Get.lazyPut(
      () => PopularSpecialtyController(popularSpecialtyRepo: Get.find()));
  Get.lazyPut(() => LaundrySpecialtyController(
      laundrySpecialtyRepo: Get.find(), cartRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
