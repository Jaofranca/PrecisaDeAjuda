import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomePageModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
      ];
}
