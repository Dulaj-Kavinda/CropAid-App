import 'package:cropaid_app/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/farmer_bottom_nav_controller.dart';
import '../common/appbar.dart';

class FarmerHomeRoot extends GetView<FarmerBottomNavController> {
  FarmerHomeRoot({Key? key}) : super(key: key);

  final FarmerBottomNavController bottomNavController =
      Get.put(FarmerBottomNavController());

  // TODO: delete bottom nav controller on sign out

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CropAidAppBar(),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: 'farmerHome',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'Home',
                backgroundColor: LightColors.kDarkGreen,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_list_bulleted,
                  size: 25,
                ),
                label: 'Log',
                backgroundColor: LightColors.kDarkGreen,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.done_outline_sharp,
                  size: 25,
                ),
                label: 'Reviewed',
                backgroundColor: LightColors.kDarkGreen,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 25,
                ),
                label: 'Profile',
                backgroundColor: LightColors.kDarkGreen,
              ),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.pink,
            onTap: controller.changePage,
          )),
    );
  }
}
