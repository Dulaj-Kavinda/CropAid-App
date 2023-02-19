import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth_controller.dart';
import '../../theme/light_colors.dart';


class SignUpScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 2, 70, 2)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/vegies.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   height: 250,
            //   width: double.infinity,
            //   child: const Text(
            //     'Cropify',
            //     style: TextStyle(
            //         color: Color.fromARGB(255, 255, 255, 255),
            //         fontWeight: FontWeight.w100,
            //         fontSize: 70,
            //         fontFamily: "Lobster",
            //         shadows: [
            //           Shadow(
            //               // bottomLeft
            //               offset: Offset(-1.5, -1.5),
            //               color: Color.fromARGB(255, 2, 70, 2)),
            //           Shadow(
            //               // bottomRight
            //               offset: Offset(1.5, -1.5),
            //               color: Color.fromARGB(255, 2, 70, 2)),
            //           Shadow(
            //               // topRight
            //               offset: Offset(1.5, 1.5),
            //               color: Color.fromARGB(255, 2, 70, 2)),
            //           Shadow(
            //               // topLeft
            //               offset: Offset(-1.5, 1.5),
            //               color: Color.fromARGB(255, 2, 70, 2)),
            //         ]),
            //   ),
            // ),
            const Image(image: AssetImage(
              'assets/auth-1.png',
            ),
                height: 300
            ),
            Text(
              'CROPAID',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline3,
                fontSize: 43,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 2, 70, 2),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Email",  border: InputBorder.none,),
                        controller: emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldContainer(
                      child:  TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: const Text("Sign Up"),
                      onPressed: () {
                        controller.createUser(
                            emailController.text, passwordController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: LightColors.kLightGreen2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}