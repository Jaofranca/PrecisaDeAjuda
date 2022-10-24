import 'package:flutter_modular/flutter_modular.dart';
import 'package:precisa_de_ajuda/Modules/user_profile/user_profile_page.dart';

class UserProfileModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const UserProfilePage()),
      ];
}
