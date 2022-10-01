import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AuthPage()),
      ];
}
