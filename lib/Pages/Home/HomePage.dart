import 'package:parking_system_map/Controller/AuthController.dart';
import 'package:parking_system_map/Controller/ParkingController.dart';
import 'package:parking_system_map/Controller/ThemeController.dart';
import 'package:parking_system_map/Pages/CCTVPage/CctvPage.dart';
import 'package:parking_system_map/Pages/Notification/NotificationPage.dart';
import 'package:parking_system_map/Pages/PakingSlotPage/ParkingSlotPage.dart';
import 'package:parking_system_map/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ConstData.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    ParkingController parkingController = Get.put(ParkingController());
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "DASHBOARD",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                themeController.changeTheme();
              },
              icon: themeController.isDark.value
                  ? Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.nightlight_round,
                      color: Colors.white,
                    ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 20),
            // SvgPicture.asset(
            //   "Assets/Icons/logo.svg",
            //   color: Theme.of(context).colorScheme.onBackground,
            // ),
            Image.asset(
              AppLogo,
              width: 120,
            ),
            SizedBox(height: 20),
            Text(
              AppName,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 5),
            Text(
              "Welcome to Parkish. Here you can book your parking slot from any where with you phone",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Get.to(ParkingSlotPage());
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.car_rental,
                      size: 40,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "View Parking Slot",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () async {
                await parkingController.personalBooking();
                // Get.to(ProfilePage());
                // await parkingController.checkingCarisParkedOrNot();
                // parkingController.isYourCarParked.value
                //     ? Get.to(CctvPage())
                //     : Get.snackbar(
                //         "Unparked Vehicle ", "Please park your vehicle first");
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.videocam_rounded,
                      size: 40,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "View CCTV Footage",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "Profile Page",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Get.to(NotificationPage());
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 40,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "View Notification",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                authController.signOut();
              },
              icon: Icon(Icons.logout),
              label: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
