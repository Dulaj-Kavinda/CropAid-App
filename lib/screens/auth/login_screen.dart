import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth_controller.dart';
import '../../theme/light_colors.dart';

class LoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Image(image: AssetImage(
              'assets/auth-5.png',
            ),
              height: 350
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Email", border: InputBorder.none,),
                        controller: emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
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
                      child: const Text("Log In"),
                      onPressed: () {
                        controller.login(
                            emailController.text, passwordController.text);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Sign Up",
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 70, 2)),
                      ),
                      onPressed: () {
                        Get.toNamed('/signup-screen');
                      },
                    )
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