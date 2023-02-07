import 'dart:io';

import 'package:cropaid_app/controllers/media_picker_controller.dart';

import 'package:cropaid_app/screens/common/video_settings.dart';
import 'package:cropaid_app/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends GetView<CameraController> {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton<int>(
                  child: Container(
                      decoration: BoxDecoration(
                        color: LightColors.kDarkGreen,
                        border: Border.all(
                          color: const Color.fromARGB(255, 216, 213, 213),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                              child: Text(
                                "Images",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        controller.pickImageFromCamera(ImageSource.camera);
                      },
                      value: 1,
                      child: const Text("From Camera"),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      onTap: () {
                        controller.pickImageFromGallery();
                      },
                      value: 2,
                      child: const Text("From Gallery"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                PopupMenuButton<int>(
                  child: Container(
                      decoration: BoxDecoration(
                        color: LightColors.kDarkBlue,
                        border: Border.all(
                          color: const Color.fromARGB(255, 216, 213, 213),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                              child: Icon(
                                Icons.video_camera_back_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                              child: Text(
                                "Videos",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        controller.pickVideo(ImageSource.camera);
                      },
                      value: 1,
                      child: const Text("From Camera"),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      onTap: () {
                        controller.pickVideo(ImageSource.gallery);
                      },
                      value: 2,
                      child: const Text("From Gallery"),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.swipeLeft();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        width: double.infinity,
                        child: controller.medias!.isEmpty
                            ? FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset('assets/no_image.jpg'),
                              )
                            : controller.medias![controller.visibleFileIndex!]
                                        .type ==
                                    "Image"
                                ? Image.file(File(controller
                                    .medias![controller.visibleFileIndex!]
                                    .file
                                    .path))
                                : VideoDisplay(
                                    filePath: controller
                                        .medias![controller.visibleFileIndex!]
                                        .file
                                        .path,
                                  ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.swipeRight();
                    },
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            IconButton(
              onPressed: () {
                controller.removeMedia();
              },
              icon: const Icon(Icons.delete,size: 40,),
              color: Colors.red,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
