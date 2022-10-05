import 'package:flutter_modular/flutter_modular.dart';
import 'package:precisa_de_ajuda/Modules/auth/pages/continue_registration.dart';
import 'package:precisa_de_ajuda/Modules/home_page/home_page_module.dart';

import 'controller/auth_page_controller.dart';
import 'pages/auth_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthPageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const AuthPage()),
        ChildRoute('/continue_registration',
            child: (context, args) => const ContinueRegistration()),
        ModuleRoute('/home_page', module: HomePageModule()),
      ];
}
