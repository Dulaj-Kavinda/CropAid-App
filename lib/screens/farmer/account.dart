import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';
import '../../widgets/top_container.dart';

class FarmerAccount extends GetWidget<UserController> {
  const FarmerAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                'My Profile'.tr,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 2, 105, 48),
                color: Colors.white30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 60,
                            ),
                            const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: Color.fromARGB(255, 2, 70, 2),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Personal Info".tr,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 2, 70, 2),
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Name".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.name!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("NIC".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.nic!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Email Address".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.email!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Mobile Number".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.phone!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 2, 105, 48),
                color: Colors.white30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 60,
                            ),
                            const Icon(
                              Icons.agriculture,
                              size: 35,
                              color: Color.fromARGB(255, 2, 70, 2),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Farm Info".tr,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 2, 70, 2),
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Farm Name".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.farm!.name!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Address".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.farm!.address!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Reg. Number".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.farm!.regNum!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shadowColor: const Color.fromARGB(255, 2, 105, 48),
                color: Colors.white30,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 60,
                            ),
                            const Icon(
                              Icons.account_balance,
                              size: 35,
                              color: Color.fromARGB(255, 2, 70, 2),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Bank Details".tr,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 2, 70, 2),
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Bank Name".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.bank!.name!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Text("Account Number".tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 17)),
                            const SizedBox(width: 20),
                            const Text(
                              ":  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              controller.user.bank!.accountNum!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ],
        )))
      ]),
    );
  }
}
