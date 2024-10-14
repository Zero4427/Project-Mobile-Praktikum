import 'package:get/get.dart';
import 'package:demo/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => ProductPage(),
    ),
  ];
}
