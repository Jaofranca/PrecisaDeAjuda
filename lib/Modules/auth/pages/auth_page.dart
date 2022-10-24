import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:precisa_de_ajuda/Modules/auth/models/user_model.dart';
import 'package:precisa_de_ajuda/Modules/auth/widgets/login_textfield.dart';

import '../controller/auth_page_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage();

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var message = "";
  bool type = false;
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthPageController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: Colors.white,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Precisa de Ajuda?".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: constraints.maxWidth * 0.9,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        LoginTextField(
                            controller: emailController, hintText: "Email"),
                        const SizedBox(height: 20),
                        LoginTextField(
                            controller: passwordController,
                            hintText: "Password"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.7,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            controller.setUserEmail(
                              emailController.text,
                            );
                            controller.setUserPassword(passwordController.text);
                            message = await controller.logInUser();
                            if (message == "success") {
                              Modular.to.pushNamed("/home_page/");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    message,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Log in".toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Modular.to.pushNamed("/register_page");
                        },
                        child: Text("cadastre-se".toUpperCase()),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
