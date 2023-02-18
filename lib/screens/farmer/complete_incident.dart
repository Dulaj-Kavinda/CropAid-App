import 'package:cropaid_app/controllers/farmer_complete_incident_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/incident_status.dart';
import '../../widgets/top_container.dart';

class CompleteIncident extends GetWidget<FarmerCompleteIncidentController> {
  const CompleteIncident({Key? key}) : super(key: key);

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
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Reviewed Incidents".tr,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () {
                    if ((controller.completeIncidents.isNotEmpty)) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                          child: ListView.builder(
                              itemCount: controller.completeIncidents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0, 10.0),
                                  child: Card(
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
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                    controller
                                                        .completeIncidents[
                                                            index]
                                                        .date!
                                                        .toDate()
                                                        .toString()
                                                        .split(" ")
                                                        .first,
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "Poppins",
                                                        fontSize: 15)),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                controller
                                                    .completeIncidents[index]
                                                    .types!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Theme(
                                              data: Theme.of(context).copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: ExpansionTile(
                                                tilePadding: EdgeInsets.zero,
                                                title: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: controller
                                                                  .completeIncidents[
                                                                      index]
                                                                  .status ==
                                                              IncidentStatus
                                                                  .COMPLETED
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              105, 241, 105)
                                                          : const Color
                                                                  .fromARGB(221,
                                                              238, 84, 38)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    controller
                                                                .completeIncidents[
                                                                    index]
                                                                .status!
                                                                .name ==
                                                            "REJECTED"
                                                        ? controller
                                                            .completeIncidents[
                                                                index]
                                                            .status!
                                                            .name
                                                        : "ACCEPTED",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "Poppins",
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                children: [
                                                  if (controller
                                                          .completeIncidents[
                                                              index]
                                                          .reviewDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                                "${"Reviewed Date".tr}:",
                                                                style: const TextStyle(
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
                                                                      .completeIncidents[
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
                                                    )
                                                  ],
                                                  if (controller
                                                          .completeIncidents[
                                                              index]
                                                          .rejectDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                                "${"Rejected Date".tr}:",
                                                                style: const TextStyle(
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
                                                                      .completeIncidents[
                                                                          index]
                                                                      .rejectDate!
                                                                      .toDate()
                                                                      .toString()
                                                                      .split(
                                                                          " ")
                                                                      .first,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                  if (controller
                                                          .completeIncidents[
                                                              index]
                                                          .completeDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                                "${"Accepted Date".tr}:",
                                                                style: const TextStyle(
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
                                                                      .completeIncidents[
                                                                          index]
                                                                      .completeDate!
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
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                                "${"Amount Payed".tr}:",
                                                                style: const TextStyle(
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
                                                                  "${"Rs.".tr} ${controller
                                                                          .completeIncidents[
                                                                              index]
                                                                          .amount}",
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
                                                        SizedBox(
                                                          child: Text(
                                                              "${"Comments".tr}:",
                                                              style: const TextStyle(
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
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(controller
                                                                .completeIncidents[
                                                                    index]
                                                                .comment!),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 40, 0),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: Text(
                                                              "${"Description".tr}:",
                                                              style: const TextStyle(
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
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(controller
                                                                .completeIncidents[
                                                                    index]
                                                                .description!),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 40, 0),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          child: Text("${"Nr of Acres".tr}:",
                                                              style: const TextStyle(
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
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(controller
                                                                .completeIncidents[
                                                                    index]
                                                                .acres!
                                                                .toString()),
                                                          ),
                                                        ),
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
