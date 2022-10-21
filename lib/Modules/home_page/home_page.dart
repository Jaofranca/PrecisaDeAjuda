import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth/controller/auth_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<AuthController>();
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
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: const Color(0xff4CC9F0).withOpacity(0.8),
            child: Column(
              children: [
                const Text("sugestões de serviços por perto"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  width: constraints.maxWidth * 0.5,
                  child: FutureBuilder(
                    future: controller.getPrestadores(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: controller.prestadores.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                tileColor: Colors.red,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                title:
                                    Text(controller.prestadores[index].name!));
                          },
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
            ),
          );
        },
      ),
    );
  }
}
