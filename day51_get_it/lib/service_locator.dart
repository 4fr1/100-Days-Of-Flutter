import 'package:day51_get_it/services/login_service.dart';
import 'package:day51_get_it/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(UserService());
  locator.registerFactory<LoginService>(() => LoginService());
}