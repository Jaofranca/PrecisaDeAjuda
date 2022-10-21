import 'package:flutter_modular/flutter_modular.dart';
import 'package:precisa_de_ajuda/Modules/user_profile/user_profile_page.dart';

import '../auth/controller/auth_page_controller.dart';

class UserProfileModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const UserProfilePage()),
      ];
}
