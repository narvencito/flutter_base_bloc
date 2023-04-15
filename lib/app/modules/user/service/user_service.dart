import 'package:dio/dio.dart';
import 'package:emerson/app/app.dart';

class UserService {
  final dio = getItApp.get<Dio>();

  Future<String> login() async {
    return '';
  }

  Future<bool> logOut() async {
    return true;
  }
}
