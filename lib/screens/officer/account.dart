import 'dart:io';

import 'package:cropaid_app/controllers/user_controller.dart';
import 'package:cropaid_app/screens/common/theme.dart';

import 'package:cropaid_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/light_colors.dart';
import '../../widgets/top_container.dart';

class OfficerAccount extends StatelessWidget {
  OfficerAccount({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nicController = TextEditingController();

  UserController userController = Get.find<UserController>();

  File? userImageFile;

  @override
  Widget build(BuildContext context) {
    nameController.text = userController.user.name!;
    phoneController.text = userController.user.phone!;
    nicController.text = userController.user.nic!;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                              'Update Profile',
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
                // ImageProfile(context),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildTextFormField("Name", nameController, false),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildTextFormField(
                            "Phone Number", phoneController, true),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildTextFormField("NIC Number", nicController, false),
                      ]
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.grey),
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Cancel",
                            style: CropAidThemes.buttonTextTheme,
                          )),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          if (GetUtils.isPhoneNumber(phoneController.text)) {
                            userController.updateOfficer(
                                nameController.text,
                                phoneController.text,
                                nicController.text,
                                userController.user.profilePicRef!);
                          } else {
                            Snackbar.showError(
                                "Please enter a valid phone number");
                          }
                          if (userController.isLoading.value) {
                            Get.dialog(
                                const Center(child: CircularProgressIndicator()),
                                barrierDismissible: false);
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: CropAidThemes.buttonTextTheme,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
      )
    );

  }

  TextFieldContainer _buildTextFormField(String labelText, TextEditingController controller, bool isPhonenumber) {
    return TextFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        keyboardType: isPhonenumber ? TextInputType.phone : TextInputType.text,
        controller: controller,
      ),
    );
  }

  Widget ImageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => CircleAvatar(
                radius: 80,
                backgroundColor: const Color.fromARGB(255, 181, 182, 204),
                backgroundImage: userController.isProfilePathSet.value == true
                    ? FileImage(File(userController.profilePath.value))
                    : NetworkImage(userController.user.profilePicRef!)
                        as ImageProvider,
              )),
          Positioned(
            child: InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  height: 120.0,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 181, 182, 204),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 50,
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Choose Profile Photo",
                            style: TextStyle(
                              fontSize: 20.0,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 10),
                            FloatingActionButton.extended(
                                onPressed: () => takePhoto(ImageSource.camera),
                                icon: const Icon(Icons.camera),
                                label: const Text("Camera")),
                            const SizedBox(width: 50),
                            FloatingActionButton.extended(
                                onPressed: () => takePhoto(ImageSource.gallery),
                                icon: const Icon(Icons.image),
                                label: const Text("Gallery"))
                          ],
                        )
                      ],
                    ),
                  ),
                ));
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                margin: const EdgeInsets.fromLTRB(120, 120, 0, 0),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      userImageFile = File(pickedFile.path);
      print(userImageFile);
      userController.setProfileImagePath(pickedFile.path);

      Get.back();
    }
  }
}



class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: LightColors.kFormBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}