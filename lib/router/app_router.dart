import 'package:auto_route/auto_route.dart';
import 'package:store_test/features/home/view/home_screen.dart';
import 'package:store_test/features/welcome/view/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
