import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:precisa_de_ajuda/Modules/auth/widgets/login_textfield.dart';

import '../controller/auth_page_controller.dart';
import '../user_model.dart';
import '../utils/validate.dart';

class ContinueRegistration extends StatefulWidget {
  const ContinueRegistration();

  @override
  State<ContinueRegistration> createState() => _ContinueRegistrationState();
}

class _ContinueRegistrationState extends State<ContinueRegistration> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ocupationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthPageController>();
    emailController.text = controller.actualUser.userEmail;
    passwordController.text = controller.userPassword;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Completar Registro"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      mask: '##.###-###',
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
