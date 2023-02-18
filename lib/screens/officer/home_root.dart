import 'package:cropaid_app/controllers/officer_bottom_nav_controller.dart';
import 'package:cropaid_app/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cropaid_app/theme/light_colors.dart';
class OfficerHomeRoot extends GetView<OfficerBottomNavController> {
  OfficerHomeRoot({Key? key}) : super(key: key);

  final OfficerBottomNavController officerBottomNavController =
      Get.put(OfficerBottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const OfficerAppBar(),
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: 'officerHome',
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: Obx(
          (() => BottomNavigationBar(
                elevation: 10,
                type: BottomNavigationBarType.shifting,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: LightColors.kDarkBlue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.incomplete_circle),
                    label: 'In-Progress',
                    backgroundColor: LightColors.kDarkBlue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle),
                    label: 'Complete',
                    backgroundColor: LightColors.kDarkBlue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                    backgroundColor: LightColors.kDarkBlue,
                  ),
                ],
                currentIndex: controller.currentIndex.value,
                selectedItemColor: Colors.pink,
                onTap: controller.changePage,
              )),
        )
    );
  }
}
