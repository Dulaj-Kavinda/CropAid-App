import 'package:cropaid_app/controllers/incident_controller.dart';
import 'package:cropaid_app/models/incident.dart';
import 'package:cropaid_app/models/incident_status.dart';
import 'package:cropaid_app/screens/common/theme.dart';
import 'package:cropaid_app/screens/common/video_settings.dart';
import 'package:cropaid_app/screens/officer/appbar.dart';
import 'package:cropaid_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/report_incident_controller.dart';
import '../../theme/light_colors.dart';
import '../../widgets/back_button.dart';
import '../../widgets/top_container.dart';

class IncidentInfo extends GetWidget<AuthController>  {
  IncidentInfo({Key? key}) : super(key: key);

  IncidentModel incident = Get.arguments;

  final TextEditingController commentController = TextEditingController();
  final TextEditingController amountContorller = TextEditingController();
  final double labelWidth = 150;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var downwardIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );

    IncidentController incidentController =
        Get.put<IncidentController>(IncidentController());
    return Scaffold(
      // appBar: const OfficerAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopContainer(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                width: width,
                height: height * .3,
                imageName: 'assets/crop_damage.png',
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      MyBackButton(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Incident Details',
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Name :",
                            style: CropAidThemes.mainTextTheme,
                          ),
                        ),
                        Text(incident.user!.name!,
                            style: CropAidThemes.subTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Date :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        Text(
                            incident.date!.toDate().toString().split(" ").first,
                            style: CropAidThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Location :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.address!,
                            style: CropAidThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Bank :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.bankName!,
                            style: CropAidThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Account No :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.accountNum!,
                            style: CropAidThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Crop Types :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            incident.types!,
                            style: CropAidThemes.mainTextTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Acres Affected :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.acres.toString(),
                            style: CropAidThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Description :",
                            style: CropAidThemes.subTextTheme,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            incident.description!,
                            style: CropAidThemes.mainTextTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _showStatus(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Photos & Videos",
                      style: CropAidThemes.subTextTheme,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildGridView(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildProgressButton(incidentController),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: incident.media!.length,
      itemBuilder: (context, index) {
        bool isVideo = incident.media![index].type == "Video";
        return GestureDetector(
          onTap: isVideo
              ? () => openVideoPlayer(incident.media![index].mediaRef!)
              : () => openImageViewer(incident.media![index].mediaRef!),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Colors.white,
                child: Image.network(
                    isVideo
                        ? incident.media![index].thumbnail!
                        : incident.media![index].mediaRef!,
                    fit: BoxFit.cover),
              ),
              isVideo
                  ? const Icon(
                      Icons.play_circle_fill_rounded,
                      size: 32,
                      color: Colors.white70,
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget _showStatus() {
    switch (incident.status) {
      case IncidentStatus.NEW:
        return Row(
          children: [
            SizedBox(
              width: labelWidth,
              child: const Text(
                "Status :",
                style: CropAidThemes.subTextTheme,
              ),
            ),
            const Text("New", style: CropAidThemes.mainTextTheme),
          ],
        );
      case IncidentStatus.IN_PROGRESS:
        return Row(
          children: [
            SizedBox(
              width: labelWidth,
              child: const Text(
                "Status :",
                style: CropAidThemes.subTextTheme,
              ),
            ),
            const Text("In-Progress", style: CropAidThemes.mainTextTheme),
          ],
        );
      case IncidentStatus.COMPLETED:
        return Column(children: [
          Row(
            children: [
              SizedBox(
                width: labelWidth,
                child: const Text(
                  "Status :",
                  style: CropAidThemes.subTextTheme,
                ),
              ),
              const Text("Completed", style: CropAidThemes.mainTextTheme),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: labelWidth,
                child: const Text(
                  "Amount :",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Poppins"),
                ),
              ),
              Text("Rs." + incident.amount.toString(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 126, 12),
                      fontFamily: "Poppins")),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: labelWidth,
                child: const Text(
                  "Comment :",
                  style: CropAidThemes.subTextTheme,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  incident.comment!,
                  style: CropAidThemes.mainTextTheme,
                ),
              ),
            ],
          )
        ]);

      default:
        return Container();
    }
  }

  Widget _buildProgressButton(IncidentController incidentController) {
    switch (incident.status) {
      case IncidentStatus.NEW:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                openAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Reject",
                style: CropAidThemes.buttonTextTheme,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                incidentController.setStatus(
                    incident.id!, IncidentStatus.IN_PROGRESS, '', 0.0);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                "In-Progress",
                style: CropAidThemes.buttonTextTheme,
              ),
            ),
          ],
        );

      case IncidentStatus.IN_PROGRESS:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                openAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Reject",
                style: CropAidThemes.buttonTextTheme,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openPaymentAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                "Make Payment",
                style: CropAidThemes.buttonTextTheme,
              ),
            )
          ],
        );

      default:
        return Container();
    }
  }

  openImageViewer(String url) {
    Get.defaultDialog(
        title: "Preview",
        radius: 4,
        content: SizedBox(
          height: 300,
          child: Container(color: Colors.white, child: Image.network(url)),
        ));
  }

  openVideoPlayer(String url) {
    Get.defaultDialog(
        title: "Preview",
        radius: 4,
        content: SizedBox(
          height: 400,
          child: VideoDisplay(urlPath: url),
        ));
  }

  openAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Confirm Rejection",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "Poppins"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Leave a comment...",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    incidentController.setStatus(incident.id!,
                        IncidentStatus.REJECTED, commentController.text, 0.0);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  openPaymentAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Make Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "Poppins"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: amountContorller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Amount (Rs.)",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Leave a comment...",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (amountContorller.text.isEmpty) {
                      Snackbar.showError("Amount Cannot Be Empty!");
                      return;
                    }
                    incidentController.startPaymentOption(
                        incident.id!,
                        incident.user!.name!,
                        incident.user!.accountNum!,
                        incident.user!.bankName!,
                        commentController.text,
                        double.parse(amountContorller.text),
                        incident.user!.address!,
                        incident.user!.fcmToken!);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
