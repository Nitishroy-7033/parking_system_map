import 'package:parking_system_map/Controller/AuthController.dart';
import 'package:parking_system_map/Pages/Auth/LoginPage.dart';
import 'package:parking_system_map/Pages/Home/HomePage.dart';
import 'package:get/get.dart';

import '../Pages/GoogleMap/GoogleMap.dart';


class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceHandle();
  }

  AuthController authController = Get.put(AuthController());
  Future<void> splaceHandle() async {
    await Future.delayed(const Duration(seconds: 10));
    if (authController.auth.currentUser != null) {
      // Get.offAll(const HomePage());
      Get.offAll(const GoogleMapPage());
    } else {
      Get.offAll(const LoginPage());
    }
  }
}