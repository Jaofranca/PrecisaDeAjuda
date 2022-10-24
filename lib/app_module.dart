import 'package:flutter_modular/flutter_modular.dart';

import 'Modules/auth/auth_module.dart';
import 'Modules/home_page/home_page_module.dart';
import 'Modules/user_profile/user_profile_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: AuthModule()),
        ModuleRoute('/home_page', module: HomePageModule()),
        ModuleRoute('/user_profile', module: UserProfileModule()),
      ];
}
