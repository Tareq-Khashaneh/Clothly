import 'package:clothly/core/constants/auth_storage.dart';
import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/features/auth/data/models/user_model.dart';
import 'package:clothly/features/auth/data/providers/auth_pro.dart';
import 'package:clothly/features/auth/data/repositories/auth_repo.dart';
import 'package:clothly/features/service/app_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    _authPro = AuthProvider(
        authRepo: AuthRepo(networkService: appService.networkService));
    super.onInit();
  }

  final AppService appService = Get.find();
  late int selectedIndex = 0;

  late String password;
  late String confirmPassword;
  late String email;
  late String fullName;
  late String phoneNumber;
  UserModel? userModel;
  late AuthProvider _authPro;

  Future<bool> signup() async {
    try {
      parameters params = {
        'email': email,
        'password': password,
        'full_name': fullName,
        'phone_number': phoneNumber,
        'password_confirmation': confirmPassword,
      };
      parameters? data = await _authPro.signup(params: params);
      if (data != null) {
        AuthStorage.saveToken(data['token']);
        userModel = data['user'];
        return true;
      }
      return false;
    } catch (e) {
      print("error in signup $e");
    }
    return false;
  }

  Future<bool> login() async {
    try {
      parameters params = {"email": email, "password": password};
      parameters? data = await _authPro.login(params: params);
      if (data != null) {
        AuthStorage.saveToken(data['token']);
        userModel = data['user'];
        appService.currentUser = userModel;
        return true;
      }
      return false;
    } catch (e) {
      print("error in signup $e");
    }
    return false;
  }

  void changeIndex({required int index}) {
    selectedIndex = index;
    update();
  }
}
