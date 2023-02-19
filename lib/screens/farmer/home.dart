import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../services/database.dart';
import '../../theme/light_colors.dart';
import '../../widgets/task_column.dart';
import '../../widgets/top_container.dart';

class FarmerHome extends GetWidget<AuthController> {
  FarmerHome({Key? key}) : super(key: key);


  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'සිංහල', 'locale': const Locale('si', 'LK')},
  ];


  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  UserController userController = Get.find<UserController>();

  var newIncidentCount;
  var inProgressIncidentCount;
  var completedIncidentCount;
  var rejectedIncidentCount;

  getCounts() async {
    newIncidentCount=(await Database().getNewIncidentCount(userController.user.id));
    inProgressIncidentCount=(await Database().getInprogressIncidentCount(userController.user.id));
    completedIncidentCount=(await Database().getCompletedIncidentCount(userController.user.id));
    rejectedIncidentCount=(await Database().getRejectedIncidentCount(userController.user.id));
  }



  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Your Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    getCounts();


    //int newIncidentCount=Database().getNewIncidentCount(userController.user.id);

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
                      IconButton(
                          onPressed: () {
                            buildLanguageDialog(context);
                          },
                          icon: const Icon(Icons.language,
                              color: LightColors.kDarkBlue, size: 30.0)),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Are you sure?".tr,
                              middleText: " ",
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Cancel".tr)),
                                const SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1.0, color: Color.fromARGB(255, 2, 70, 2)),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      controller.signOut();
                                    },
                                    child: Text(
                                      "Confirm".tr,
                                      style: const TextStyle(color: Color.fromARGB(255, 2, 70, 2)),
                                    )),
                              ],
                            );

                          },
                          icon: const Icon(Icons.logout,
                              color: LightColors.kDarkBlue, size: 30.0)),
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
                          children: <Widget>[
                            Text(
                              userController.user.name!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
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
                    label: Text(
                      'ADD NEW CROP DAMAGE'.tr,
                      style: const TextStyle(
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
                          title: '${'New'.tr} ${'Incidents'.tr}',
                          subtitle: '${newIncidentCount.toString()} ${'incident(s)'.tr}',
                        ),
                        const SizedBox(height: 16.0),
                        TaskColumn(
                          icon: Icons.check_circle_outline,
                          iconBackgroundColor: LightColors.kBlue,
                          title: '${'In-Progress'.tr} ${'Incidents'.tr}',
                          subtitle: '${inProgressIncidentCount.toString()} ${'incident(s)'.tr}',
                        ),
                        const SizedBox(height: 16.0),
                        TaskColumn(
                          icon: Icons.approval_outlined,
                          iconBackgroundColor: LightColors.kLightGreen,
                          title: '${'Completed'.tr} ${'Incidents'.tr}',
                          subtitle: '${completedIncidentCount.toString()} ${'incident(s)'.tr}',
                        ),
                        const SizedBox(height: 16.0),
                        TaskColumn(
                          icon: Icons.cancel_outlined,
                          iconBackgroundColor: LightColors.kRed,
                          title: '${'Rejected'.tr} ${'Incidents'.tr}',
                          subtitle: '${rejectedIncidentCount.toString()} ${'incident(s)'.tr}',
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
