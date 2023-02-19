import 'package:cropaid_app/controllers/media_picker_controller.dart';
import 'package:cropaid_app/controllers/report_incident_controller.dart';
import 'package:cropaid_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../controllers/damage_type_controller.dart';
import '../../theme/light_colors.dart';
import '../../widgets/top_container.dart';
import 'media_picker.dart';

class ReportIncident extends GetView<ReportIncidentController> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController acresController = TextEditingController();

  final CameraController cameraController = Get.put(CameraController());
  final UserController userController = Get.put(UserController());

  final DamageTypeController damageTypeController=Get.put(DamageTypeController());

  ReportIncident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TopContainer(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                        width: width,
                        height: height * .48+ damageTypeController.typeCount*0.1,
                        imageName: 'assets/crop_damage.png',
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag: 'backButton',
                              child: GestureDetector(
                                onTap: () {
                                  _onBackPressed();
                                },
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Inform new crop damage'.tr,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${'Damage Type'.tr}*",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                            minHeight: 100,
                                            minWidth: double.infinity),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: GetX<ReportIncidentController>(
                                          builder: (_) {
                                            if (_.crops!.isNotEmpty) {
                                              return MultiSelectDialogField(
                                                buttonText: Text(
                                                  "Select Category".tr,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                title:
                                                    Text('Select Type'.tr),
                                                items: _.crops!
                                                    .map((e) =>
                                                        MultiSelectItem(e, e))
                                                    .toList(),
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                buttonIcon: Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                                listType:
                                                    MultiSelectListType.CHIP,
                                                onConfirm: (values) {
                                                  controller.selectedCropTypes =
                                                      values
                                                          .map((e) =>
                                                              e.toString())
                                                          .toList();
                                                  damageTypeController.updateDes(values.length);
                                                },
                                              );
                                            } else {
                                              return const Center(
                                                  child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child:
                                                          CircularProgressIndicator()));
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${"Affected Area (Acres)".tr}*",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            TextFormField(
                              controller: acresController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'(^\d*\.?\d*)')),
                              ],
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter number of acres".tr,
                                hintStyle: const TextStyle(fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${"Description".tr}*",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            TextFormField(
                              controller: descriptionController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              minLines: 1,
                              maxLines: 5,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Describe the incident in details".tr,
                                hintStyle: const TextStyle(fontSize: 15),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "${"Upload Photos/ Videos".tr}*",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Minimum of 3 evidences should be uploaded".tr,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 10),
                            FloatingActionButton.extended(
                              onPressed: () async {
                                Get.dialog(Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Camera(),
                                  ],
                                ));
                              },
                              label: Text(
                                'Photos/ Videos'.tr,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                ),
                              ),
                              icon: const Icon(
                                Icons.photo_camera_sharp,
                                size: 30,
                                color: Colors.black,
                              ),
                              backgroundColor: LightColors.kLightGreen2,
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (controller.selectedCrops.isEmpty ||
                                      acresController.value.text.isEmpty ||
                                      descriptionController.value.text.isEmpty) {
                                    Get.snackbar("Invalid".tr, "Please fill all fields".tr,
                                        snackPosition: SnackPosition.BOTTOM,
                                        snackStyle: SnackStyle.FLOATING,
                                        backgroundColor: Colors.red);
                                  } else if (Get.find<CameraController>().medias!.length <
                                      3) {
                                    Get.snackbar("Invalid".tr,
                                        "Please select at least 3 photos/videos".tr,
                                        snackPosition: SnackPosition.BOTTOM,
                                        snackStyle: SnackStyle.FLOATING,
                                        backgroundColor: Colors.red);
                                  } else {
                                    controller.reportIncident(
                                        Get.find<UserController>().user,
                                        controller.selectedCrops,
                                        double.parse(acresController.text),
                                        descriptionController.text,
                                        Get.find<CameraController>().medias!);
                                  }


                                  if (controller.isLoading.value) {
                                    Get.dialog(
                                        const Center(child: CircularProgressIndicator()),
                                        barrierDismissible: false);
                                  }
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: width*0.7,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                        width: width*0.6,
                                        decoration: BoxDecoration(
                                          color: LightColors.kDarkGreen,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          'Create Complaint'.tr,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    if (controller.selectedCrops.isNotEmpty ||
        acresController.value.text.isNotEmpty ||
        descriptionController.value.text.isNotEmpty ||
        Get.find<CameraController>().medias!.isNotEmpty) {
      Get.defaultDialog(
        title: "Are you sure?".tr,
        middleText: "All changes will be lost".tr,
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
                Get.back(closeOverlays: true);
                controller.selectedCrops.clear();
              },
              child: Text(
                "Confirm".tr,
                style: const TextStyle(color: Color.fromARGB(255, 2, 70, 2)),
              )),
        ],
      );
    } else {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
