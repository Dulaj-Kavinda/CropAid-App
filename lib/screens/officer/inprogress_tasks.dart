import 'package:cropaid_app/models/incident_status.dart';
import 'package:cropaid_app/screens/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/incident_controller.dart';
import '../../widgets/back_button.dart';
import '../../widgets/top_container.dart';
import '../../theme/light_colors.dart';

class InprogressTasks extends StatelessWidget {
  InprogressTasks({Key? key}) : super(key: key);

  IncidentController incidentController =
      Get.put<IncidentController>(IncidentController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          TopContainer(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: width,
            height: height * .2,
            imageName: 'assets/crop_damage.png',
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Pending Incidents',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Obx(
            () {
              if (incidentController.inprogressIncidents.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: incidentController.inprogressIncidents.length,
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
                                              .inprogressIncidents[index]
                                              .user!
                                              .name!,
                                          style: CropAidThemes.mainTextTheme,
                                        ),
                                        Text(
                                          incidentController
                                              .inprogressIncidents[index].date!
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
                                        width: 250,
                                        child: Text(
                                          incidentController
                                              .inprogressIncidents[index]
                                              .types!,
                                          style: CropAidThemes.subTextTheme,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 20, 9, 119)),
                                        onPressed: () {
                                          Get.toNamed("/IncidentInfo",
                                              arguments: incidentController
                                                  .inprogressIncidents[index]);
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
                return Center(child: Image.asset("assets/no-records-gif.gif"));
              }
            },
          )
        ],
      ),
    );
  }
}
