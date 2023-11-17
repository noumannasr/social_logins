import 'package:flutter/material.dart';
import 'package:social_logins_flutter/model/user_model.dart';
import 'package:social_logins_flutter/utils/routes/routes_name.dart';
import 'package:social_logins_flutter/view/authentication/login/login_view.dart';
import 'package:social_logins_flutter/view/home/home_view.dart';


class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case RoutesName.home:
        UserModel userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (context) => HomeView(
                  userModel: userModel,
                ));

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Center(
            child: Text('No Route Defined'),
          ),
        );
    }
  }
}
