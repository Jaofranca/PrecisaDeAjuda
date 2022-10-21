import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:precisa_de_ajuda/Modules/auth/widgets/login_textfield.dart';

import '../../core/widgets/rounded_container.dart';
import '../auth/controller/auth_page_controller.dart';
import '../auth/models/user_model.dart';
import '../auth/utils/validate.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ocupationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final controller = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();
    var user = controller.actualUser;
    emailController.text = user.userEmail ?? " ";
    cpfController.text = user.cpf ?? " ";
    nameController.text = user.name ?? " ";
    ocupationController.text = user.ocupation ?? " ";
    phoneNumberController.text = user.phoneNumber ?? " ";
  }

  @override
  Widget build(BuildContext context) {
    var saving;
    return Stack(
      children: [
        Scaffold(
            // backgroundColor: AppColors.colorPrimary,
            appBar: AppBar(
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
            ),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return RoundedContainer(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  topLeft: true,
                  topRight: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Wrap(
                          runSpacing: 10,
                          children: [
                            LoginTextField(
                              formatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z0-9.@_]"))
                              ],
                              controller: emailController,
                              hintText: "EMAIL",
                            ),
                            LoginTextField(formatters: [
                              MaskTextInputFormatter(
                                mask: '###.###.###-##',
                                filter: {'#': RegExp(r'[0-9]')},
                              )
                            ], controller: cpfController, hintText: "CPF"),
                            LoginTextField(
                                controller: nameController, hintText: "NAME"),
                            LoginTextField(
                                formatters: [
                                  MaskTextInputFormatter(
                                    mask: '(##) # ####-####',
                                    filter: {'#': RegExp(r'[0-9]')},
                                  )
                                ],
                                controller: phoneNumberController,
                                hintText: "PHONE NUMBER"),
                            if (controller.actualUser.isPrestador == true) ...[
                              LoginTextField(
                                controller: ocupationController,
                                hintText: "OCUPATION",
                              ),
                            ]
                          ],
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
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                  isPrestador:
                                      ocupationController.text.isNotEmpty
                                          ? true
                                          : false,
                                ),
                              );
                              if (message == "success") {
                                Modular.to.pushNamed("/home_page/");
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      message,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Editar informações".toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
        // if (saving)
        //   const Opacity(
        //     opacity: 0.8,
        //     child: ModalBarrier(dismissible: false, color: Colors.black54),
        //   ),
        // if (saving)
        //   const Center(
        //     child: CircularProgressIndicator(),
        //   ),
      ],
    );
  }
}
