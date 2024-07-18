import 'package:auto_route/auto_route.dart';
import 'package:sezin_soft/feature/home/view/location_page.dart';
import '../../feature/auth/login/view/courier_login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: CourierLoginRoute.page,
          initial: true,
          path: '/',
        ),
         AdaptiveRoute(
          page: LocationRoute.page,
          path: RoutePath.home.path,
        ),
      ];
}

enum RoutePath {
  courierLoginPage('/'),
  home('/home');

  const RoutePath(this.path);
  final String path;
}
