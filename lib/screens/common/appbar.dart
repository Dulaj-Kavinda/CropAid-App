import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class CropAidAppBar extends GetWidget<AuthController>
    implements PreferredSizeWidget {
  final bool visible;

  const CropAidAppBar({Key? key, this.visible = true}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 70, 2),
        actions: visible
            ? [
                PopupMenuButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: TextButton(
                                  child: const Text(
                                    "Sign Out",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 80, 79, 79)),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    controller.signOut();
                                  })),
                        ])
              ]
            : []);
  }
}
