import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:precisa_de_ajuda/Modules/auth/widgets/login_textfield.dart';

import '../controller/auth_page_controller.dart';
import '../models/user_model.dart';
import '../utils/validate.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ocupationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registre-se"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            color: const Color(0xff4CC9F0),
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  LoginTextField(
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9.@_]"))
                    ],
                    controller: emailController,
                    hintText: "EMAIL",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(
                      controller: passwordController, hintText: "PASSWORD"),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(formatters: [
                    MaskTextInputFormatter(
                      mask: '###.###.###-##',
                      filter: {'#': RegExp(r'[0-9]')},
                    )
                  ], controller: cpfController, hintText: "CPF"),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(controller: nameController, hintText: "NAME"),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(
                      formatters: [
                        MaskTextInputFormatter(
                          mask: '(##) # ####-####',
                          filter: {'#': RegExp(r'[0-9]')},
                        )
                      ],
                      controller: phoneNumberController,
                      hintText: "PHONE NUMBER"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {
                        var validationMessage = "";

                        validationMessage = validateAll(
                            email: emailController.text,
                            password: passwordController.text,
                            cpf: cpfController.text,
                            name: nameController.text,
                            phoneNumber: phoneNumberController.text);

                        if (validationMessage != "Success") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                validationMessage,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                          return;
                        }

                        final message = await controller.updateUser(
                          UserModel(
                            name: nameController.text,
                            userEmail: emailController.text,
                            cpf: cpfController.text,
                            phoneNumber: phoneNumberController.text,
                            ocupation: ocupationController.text,
                            uuid: controller.userUuid,
                          ),
                        );
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
                        "Completar registro".toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
