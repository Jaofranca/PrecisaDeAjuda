import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth/controller/auth_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<AuthPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.pushNamed("/user_profile/");
              },
              icon: const Icon(Icons.abc))
        ],
        elevation: 0,
        title: const Text("Home"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "sugestões de serviços por perto",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.8,
                child: FutureBuilder(
                  future: controller.getPrestadores(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Flexible(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: controller.prestadores.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.account_box),
                                ),
                                title:
                                    Text(controller.prestadores[index].name!),
                                subtitle: Text(
                                    controller.prestadores[index].ocupation!),
                                tileColor: Colors.blueAccent,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
