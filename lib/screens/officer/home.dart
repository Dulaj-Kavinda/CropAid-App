import 'package:cropaid_app/controllers/incident_controller.dart';
import 'package:cropaid_app/models/incident_status.dart';
import 'package:cropaid_app/screens/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../theme/light_colors.dart';
import '../../widgets/top_container.dart';

class OfficerHome extends GetWidget<AuthController> {
  OfficerHome({Key? key}) : super(key: key);

  IncidentController incidentController =
      Get.put<IncidentController>(IncidentController());

  UserController userController = Get.find<UserController>();


  int count = 0;

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
                            'assets/officer.png',
                          ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            Text(
                              userController.user.name!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Text(
                              'Officer GV',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Poppins",
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
          // Container(
          //   alignment: Alignment.center,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/officer-home.png"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   height: 250,
          //   width: double.infinity,
          // )
          Obx(
            () {
              if (incidentController.incidents.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: incidentController.incidents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 0, 10.0),
                          child: Card(
                            color: LightColors.kLightBlue,
                            shadowColor: const Color.fromARGB(255, 6, 118, 182),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          incidentController
                                              .incidents[index].user!.name!,
                                          style: CropAidThemes.mainTextTheme,
                                        ),
                                        Text(
                                          incidentController
                                              .incidents[index].date!
                                              .toDate()
                                              .toString()
                                              .split(" ")
                                              .first,
                                          style: CropAidThemes.subTextTheme,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          incidentController
                                              .incidents[index].types!,
                                          style: CropAidThemes.subTextTheme,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary:  LightColors.kDarkBlue
                                        ),
                                        onPressed: () {
                                          Get.toNamed("/IncidentInfo",
                                              arguments: incidentController
                                                  .incidents[index]);
                                        },
                                        child: const Text(
                                          "Details",
                                          style: CropAidThemes.buttonTextTheme,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                // return const Center(child: CircularProgressIndicator());
                return Center(child: Image.asset("assets/no-records-gif.gif"));
              }
            },
          )
        ],
      ),
    );
  }
}
