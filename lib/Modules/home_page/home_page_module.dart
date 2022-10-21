import 'package:flutter_modular/flutter_modular.dart';
import 'package:precisa_de_ajuda/Modules/user_profile/user_profile_module.dart';

import '../auth/controller/auth_page_controller.dart';
import 'home_page.dart';

class HomePageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
        ModuleRoute('/user_profile', module: UserProfileModule()),
      ];
}
