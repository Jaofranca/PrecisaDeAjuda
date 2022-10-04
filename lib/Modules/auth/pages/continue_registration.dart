import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precisa_de_ajuda/Modules/auth/widgets/login_textfield.dart';

import '../controller/auth_page_controller.dart';
import '../user_model.dart';

class ContinueRegistration extends StatefulWidget {
  const ContinueRegistration({
    super.key,
  });

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
    emailController.text = controller.userEmail;
    passwordController.text = controller.userPassword;

    // email : RegExp("[a-zA-Z0-9.@_]"))

    return Scaffold(
        appBar: AppBar(
          title: const Text("Completar Registro"),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Center(
            child: SizedBox(
              width: constraints.maxWidth * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoginTextField(
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
                  LoginTextField(controller: cpfController, hintText: "CPF"),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(controller: nameController, hintText: "NAME"),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(
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
        ));
  }
}
