import 'package:cropaid_app/controllers/media_picker_controller.dart';
import 'package:cropaid_app/controllers/report_incident_controller.dart';
import 'package:cropaid_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../theme/light_colors.dart';
import '../../widgets/back_button.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/top_container.dart';

class ReportIncident extends GetView<ReportIncidentController> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController acresController = TextEditingController();

  final CameraController cameraController = Get.put(CameraController());
  final UserController userController = Get.put(UserController());

  ReportIncident({Key? key}) : super(key: key);

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var downwardIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                TopContainer(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  width: width,
                  height: height * .4,
                  imageName: 'assets/crop_damage.png',
                  child: Column(
                    children: <Widget>[
                      MyBackButton(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Create new complaint',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // MyTextField(
                          //   label: 'Crop damage title*',
                          //   icon: const Icon(Icons.ac_unit),
                          // ),
                          // const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Category*',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
                                          items: _.crops!
                                              .map((e) => MultiSelectItem(e, e))
                                              .toList(),
                                          listType: MultiSelectListType.CHIP,
                                          onConfirm: (values) {
                                            controller.selectedCropTypes =
                                                values
                                                    .map((e) => e.toString())
                                                    .toList();
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
                                // Row(
                                //   children: [
                                //     const Text(
                                //       'Category*',
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //         color: Colors.white,
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: Container(
                                //         constraints: const BoxConstraints(
                                //             minHeight: 100,
                                //             minWidth: double.infinity),
                                //         decoration: BoxDecoration(
                                //           border: Border.all(
                                //             color: const Color.fromARGB(
                                //                 255, 2, 70, 2),
                                //           ),
                                //           borderRadius: const BorderRadius.all(
                                //               Radius.circular(10)),
                                //         ),
                                //         child: GetX<ReportIncidentController>(
                                //           builder: (_) {
                                //             if (_.crops!.isNotEmpty) {
                                //               return MultiSelectDialogField(
                                //                 items: _.crops!
                                //                     .map((e) =>
                                //                         MultiSelectItem(e, e))
                                //                     .toList(),
                                //                 listType:
                                //                     MultiSelectListType.CHIP,
                                //                 onConfirm: (values) {
                                //                   controller.selectedCropTypes =
                                //                       values
                                //                           .map((e) =>
                                //                               e.toString())
                                //                           .toList();
                                //                 },
                                //               );
                                //             } else {
                                //               return const Center(
                                //                   child: SizedBox(
                                //                       height: 20,
                                //                       width: 20,
                                //                       child:
                                //                           CircularProgressIndicator()));
                                //             }
                                //           },
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(width: 30),
                          Expanded(
                            child: MyTextField(
                              label: 'Affected Area \n(Acres)*',
                              icon: downwardIcon,
                              hintHeight: 2.5,
                            ),
                          ),
                        ],
                      ),
                      MyTextField(
                        label: 'Description',
                        minLines: 3,
                        maxLines: 3,
                        icon: const Icon(Icons.ac_unit),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Upload Photo(s)/Video(s)',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 7),
                      FloatingActionButton.extended(
                        onPressed: () async {
                          //
                        },
                        label: const Text(
                          'Photos/ Videos',
                          style: TextStyle(
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
                    ],
                  ),
                )),
                Container(
                  height: 80,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        width: width - 40,
                        decoration: BoxDecoration(
                          color: LightColors.kDarkGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Create Complaint',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // appBar: const CropAidAppBar(
          //   visible: false,
          // ),
          // body: Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       alignment: Alignment.center,
          //       decoration: const BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage("assets/vegies-other.jpg"),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       height: 150,
          //       width: double.infinity,
          //       child: const Align(
          //         alignment: FractionalOffset.bottomCenter,
          //         child: Padding(
          //             padding: EdgeInsets.only(bottom: 10.0),
          //             child: Text(
          //               "Report  Incident",
          //               style: TextStyle(
          //                   fontFamily: "Poppins",
          //                   fontSize: 30,
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold),
          //             )),
          //       ),
          //     ),
          //     Expanded(
          //       child: SingleChildScrollView(
          //         child: Padding(
          //           padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          //           child: Column(
          //             children: <Widget>[
          //               Row(
          //                 children: [
          //                   const SizedBox(
          //                     width: 100,
          //                     child: Text("Damaged Crop Types"),
          //                   ),
          //                   Expanded(
          //                       child: Container(
          //                     constraints: const BoxConstraints(
          //                         minHeight: 100, minWidth: double.infinity),
          //                     decoration: BoxDecoration(
          //                       border: Border.all(
          //                         color: const Color.fromARGB(255, 2, 70, 2),
          //                       ),
          //                       borderRadius: const BorderRadius.all(
          //                           Radius.circular(10)),
          //                     ),
          //                     child: GetX<ReportIncidentController>(
          //                       builder: (_) {
          //                         if (_.crops!.isNotEmpty) {
          //                           return MultiSelectDialogField(
          //                             items: _.crops!
          //                                 .map((e) => MultiSelectItem(e, e))
          //                                 .toList(),
          //                             listType: MultiSelectListType.CHIP,
          //                             onConfirm: (values) {
          //                               controller.selectedCropTypes = values
          //                                   .map((e) => e.toString())
          //                                   .toList();
          //                             },
          //                           );
          //                         } else {
          //                           return const Center(
          //                               child: SizedBox(
          //                                   height: 20,
          //                                   width: 20,
          //                                   child:
          //                                       CircularProgressIndicator()));
          //                         }
          //                       },
          //                     ),
          //                   ))
          //                 ],
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Row(
          //                 children: [
          //                   const SizedBox(
          //                     width: 100,
          //                     child: Text("Acres Affected"),
          //                   ),
          //                   Container(
          //                     height: 50,
          //                     width: (MediaQuery.of(context).size.width) / 3,
          //                     decoration: BoxDecoration(
          //                       border: Border.all(
          //                         color: const Color.fromARGB(255, 2, 70, 2),
          //                       ),
          //                       borderRadius: const BorderRadius.all(
          //                           Radius.circular(10)),
          //                     ),
          //                     child: TextFormField(
          //                       controller: acresController,
          //                       keyboardType: TextInputType.number,
          //                       inputFormatters: [
          //                         FilteringTextInputFormatter.allow(
          //                             RegExp(r'(^\d*\.?\d*)')),
          //                       ],
          //                       decoration: const InputDecoration(
          //                         border: InputBorder.none,
          //                         focusedBorder: InputBorder.none,
          //                         enabledBorder: InputBorder.none,
          //                         errorBorder: InputBorder.none,
          //                         disabledBorder: InputBorder.none,
          //                         contentPadding: EdgeInsets.only(
          //                             left: 15,
          //                             bottom: 11,
          //                             top: 11,
          //                             right: 15),
          //                         hintText: "Number of acres",
          //                         hintStyle: TextStyle(fontSize: 10),
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Row(
          //                 children: [
          //                   const SizedBox(
          //                     width: 100,
          //                     child: Text("Description"),
          //                   ),
          //                   Expanded(
          //                       child: Container(
          //                     height: 120,
          //                     decoration: BoxDecoration(
          //                       border: Border.all(
          //                         color: const Color.fromARGB(255, 2, 70, 2),
          //                       ),
          //                       borderRadius: const BorderRadius.all(
          //                           Radius.circular(10)),
          //                     ),
          //                     child: TextFormField(
          //                       controller: descriptionController,
          //                       keyboardType: TextInputType.multiline,
          //                       textInputAction: TextInputAction.newline,
          //                       minLines: 1,
          //                       maxLines: 5,
          //                       decoration: const InputDecoration(
          //                         border: InputBorder.none,
          //                         focusedBorder: InputBorder.none,
          //                         enabledBorder: InputBorder.none,
          //                         errorBorder: InputBorder.none,
          //                         disabledBorder: InputBorder.none,
          //                         contentPadding: EdgeInsets.only(
          //                             left: 15,
          //                             bottom: 11,
          //                             top: 11,
          //                             right: 15),
          //                         hintText: "Describe your incident...",
          //                         hintStyle: TextStyle(fontSize: 10),
          //                       ),
          //                     ),
          //                   ))
          //                 ],
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Row(
          //                 children: [
          //                   const SizedBox(
          //                     width: 100,
          //                     child: Text("Photos & Videos"),
          //                   ),
          //                   Expanded(
          //                       child: SizedBox(
          //                     height: 50,
          //                     child: OutlinedButton.icon(
          //                       icon: const Icon(Icons.image),
          //                       label: const Text(
          //                         "Select Images/Videos",
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.w400),
          //                       ),
          //                       onPressed: () => {
          //                         Get.dialog(Column(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.center,
          //                           children: const [
          //                             Camera(),
          //                           ],
          //                         )),
          //                       },
          //                       style: ElevatedButton.styleFrom(
          //                         side: const BorderSide(
          //                             width: 1.0,
          //                             color: Color.fromARGB(255, 2, 70, 2)),
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(32.0),
          //                         ),
          //                       ),
          //                     ),
          //                   ))
          //                 ],
          //               ),
          //               const SizedBox(
          //                 height: 30,
          //               ),
          //               ElevatedButton(
          //                 child: const Text("Submit"),
          //                 onPressed: () {
          //                   if (controller.selectedCrops.isEmpty ||
          //                       acresController.value.text.isEmpty ||
          //                       descriptionController.value.text.isEmpty) {
          //                     Get.snackbar(
          //                         "Invalid Report", "Please fill all fields",
          //                         snackPosition: SnackPosition.BOTTOM,
          //                         snackStyle: SnackStyle.FLOATING,
          //                         backgroundColor: Colors.red);
          //                   } else if (Get.find<CameraController>()
          //                           .medias!
          //                           .length <
          //                       3) {
          //                     Get.snackbar("Invalid Report",
          //                         "Please select at least 3 photos/videos",
          //                         snackPosition: SnackPosition.BOTTOM,
          //                         snackStyle: SnackStyle.FLOATING,
          //                         backgroundColor: Colors.red);
          //                   } else {
          //                     controller.reportIncident(
          //                         Get.find<UserController>().user,
          //                         controller.selectedCrops,
          //                         double.parse(acresController.text),
          //                         descriptionController.text,
          //                         Get.find<CameraController>().medias!);
          //                   }
          //
          //                   if (controller.isLoading.value) {
          //                     Get.dialog(
          //                         const Center(
          //                             child: CircularProgressIndicator()),
          //                         barrierDismissible: false);
          //                   }
          //                 },
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          //)
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
        title: "Are you sure?",
        middleText: "All changes will be lost",
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel")),
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
              child: const Text(
                "Confirm",
                style: TextStyle(color: Color.fromARGB(255, 2, 70, 2)),
              )),
        ],
      );
    } else {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
