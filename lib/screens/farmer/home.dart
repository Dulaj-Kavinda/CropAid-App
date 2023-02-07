import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

import '../../theme/light_colors.dart';
import '../../widgets/task_column.dart';
import '../../widgets/top_container.dart';

class FarmerHome extends GetWidget<AuthController> {
  const FarmerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          TopContainer(
            height: 300,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            imageName: 'assets/crop_bgop.png',
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Icon(Icons.menu,
                          color: LightColors.kDarkBlue, size: 30.0),
                      IconButton(
                          onPressed: () {
                            Get.back();
                            controller.signOut();
                          },
                          icon: const Icon(Icons.logout,
                              color: LightColors.kDarkBlue, size: 25.0)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 76,
                          backgroundColor: Colors.white70,
                          child: CircleAvatar(
                            backgroundColor: LightColors.kBlue,
                            radius: 72.0,
                            backgroundImage: AssetImage(
                              'assets/avatar.png',
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'John Amex',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'Banana Farmer',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
          ),
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  FloatingActionButton.extended(
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                    label: const Text(
                      "ADD NEW CROP DAMAGE",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    backgroundColor: LightColors.kDarkGreen,
                    onPressed: () {
                      Get.toNamed('/farmerReportIncident');
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskColumn(
                          icon: Icons.blur_circular,
                          iconBackgroundColor: LightColors.kDarkYellow,
                          title: 'New Incidents',
                          subtitle: '1 incident(s) now.',
                        ),
                        const SizedBox(height: 16.0),
                        TaskColumn(
                          icon: Icons.check_circle_outline,
                          iconBackgroundColor: LightColors.kBlue,
                          title: 'In-Progress Incidents',
                          subtitle: '18 incident(s) now.',
                        ),
                        const SizedBox(height: 16.0),
                        TaskColumn(
                          icon: Icons.approval_outlined,
                          iconBackgroundColor: LightColors.kLightGreen,
                          title: 'Approved Incidents',
                          subtitle: '11 incident(s) now.',
                        ),
                        const SizedBox(height: 16.0),
                        TaskColumn(
                          icon: Icons.cancel_outlined,
                          iconBackgroundColor: LightColors.kRed,
                          title: 'Rejected Incidents',
                          subtitle: '7 incident(s) now.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}