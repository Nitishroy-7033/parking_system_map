import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> BookedPopup(BuildContext context, String slotId, String amount,
    String bookFrom, String bookTo, String name, String vehicalNumber) {
  String formatDateTime(String dateTimeString) {
    try {
      DateTime dateTime =
          DateTime.parse(dateTimeString); // Convert string to DateTime
      return DateFormat('dd MMM yyyy, hh:mm a')
          .format(dateTime); // Format to "02:56 PM"
    } catch (e) {
      return "Invalid Date"; // Handle parsing errors
    }
  }

  return Get.defaultDialog(
    barrierDismissible: false,
    title: "SLOT BOOKED",
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    ),
    content: Column(
      children: [
        Lottie.asset(
          'Assets/animation/done1.json',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Slot Booked",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
            SizedBox(width: 5),
            Text(
              "Name : $name",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.car_rental),
            SizedBox(width: 5),
            Text(
              "Vehical No  : $vehicalNumber ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.watch_later_outlined),
            SizedBox(width: 5),
            Text(
              " ${formatDateTime(bookFrom)} - ${formatDateTime(bookTo)}",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.solar_power_outlined),
            SizedBox(width: 5),
            Text(
              "Parking Slot : $slotId",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //   Image.asset("Assets/Icons/currency.png",width: 20,),
        //     Text(
        //       " $amount",
        //       style: TextStyle(
        //         fontSize: 40,
        //         fontWeight: FontWeight.w700,
        //         color: Theme.of(context).colorScheme.primary,
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Close"),
        )
      ],
    ),
  );
}
