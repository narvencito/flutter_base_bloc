import 'package:emerson/app/app.dart';
import 'package:emerson/app/modules/user/repository/i_user_repository.dart';
import 'package:emerson/app/modules/user/service/user_service.dart';

class UserRepositoryImpl extends IUserRepository {
  final UserService _userService = getItApp.get<UserService>();
  @override
  Future<void> logOut() => _userService.logOut();

  @override
  Future<void> login() => _userService.login();
}
