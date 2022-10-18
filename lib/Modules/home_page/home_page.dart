import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Column(children: [
              const Text("sugestões de serviços por perto"),
              SizedBox(
                height: constraints.maxHeight * 0.3,
                width: constraints.maxWidth * 0.5,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(title: Text("Encanador"));
                  },
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
