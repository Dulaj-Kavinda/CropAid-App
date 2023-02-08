import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/incident_log_controller.dart';
import '../../models/incident_status.dart';
import '../../theme/light_colors.dart';
import '../../widgets/top_container.dart';

class IncidentLog extends GetWidget<IncidentLogController> {
  const IncidentLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TopContainer(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: width,
            height: height * .2,
            imageName: 'assets/crop_damage.png',
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  'My Incident Log',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () {
                    if ((controller.newIncidents.isNotEmpty)) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                          child: ListView.builder(
                              itemCount: controller.newIncidents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0, 10.0),
                                  child: Card(
                                    color: Colors.grey.shade300,
                                    shadowColor:
                                        const Color.fromARGB(255, 37, 87, 39),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text("Date Added: ",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 15)),
                                                Text(
                                                    controller
                                                        .newIncidents[index]
                                                        .date!
                                                        .toDate()
                                                        .toString()
                                                        .split(" ")
                                                        .first,
                                                    style: const TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 15)),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                controller
                                                    .newIncidents[index].types!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Theme(
                                              data: Theme.of(context).copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: ExpansionTile(
                                                expandedCrossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                tilePadding:
                                                    EdgeInsets.only(right: 60),
                                                title: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                          ),
                                                          minimumSize:
                                                              Size(100, 45),
                                                          backgroundColor: controller
                                                                      .newIncidents[
                                                                          index]
                                                                      .status ==
                                                                  IncidentStatus
                                                                      .NEW
                                                              ? LightColors
                                                                  .kLightGreen
                                                              : LightColors
                                                                  .kGreen),
                                                  onPressed: () {},
                                                  child: Text(
                                                    controller
                                                        .newIncidents[index]
                                                        .status!
                                                        .name
                                                        .split("_")
                                                        .join(" "),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: "Poppins",
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                children: [
                                                  if (controller
                                                          .newIncidents[index]
                                                          .reviewDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            child: Text(
                                                                "Reviewed Date:",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        18)),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Text(
                                                                  controller
                                                                      .newIncidents[
                                                                          index]
                                                                      .reviewDate!
                                                                      .toDate()
                                                                      .toString()
                                                                      .split(
                                                                          " ")
                                                                      .first,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 40, 0),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          child: Text(
                                                              "Description:",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(controller
                                                            .newIncidents[index]
                                                            .description!),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 40, 0),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          child: Text(
                                                              "Nr of Acres:",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(controller
                                                            .newIncidents[index]
                                                            .acres!
                                                            .toString()),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
