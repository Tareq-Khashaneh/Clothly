import 'package:ecommerce_clothing/core/constants/typedef.dart';
import 'package:ecommerce_clothing/features/auth/data/models/register_model.dart';
import 'package:ecommerce_clothing/features/auth/data/providers/auth_pro.dart';
import 'package:ecommerce_clothing/features/auth/data/repositories/auth_repo.dart';
import 'package:ecommerce_clothing/features/service/app_service.dart';
import 'package:get/get.dart';

import '../data/models/login_model.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    _authPro = AuthProvider(
        authRepo: AuthRepo(networkService: appService.networkService));
    super.onInit();
  }

  final AppService appService = Get.find();
  late int selectedIndex = 0;
  late String username;
  late String password;
  late String confirmPassword;
  late String email;
  RegisterModel? registerModel;
  LoginModel? loginModel;
  late AuthProvider _authPro;

  Future<bool> register() async {
    try {
      parameters rawData = {
        'email': 'John@gmail.com',
        'username': 'johnd',
        'password': 'm38rmF\$',
        'name': {'firstname': 'John', 'lastname': 'Doe'},
        'address': {
          'city': 'kilcoole',
          'street': '7835 new road',
          'number': 3,
          'zipcode': '12926-3874',
          'geolocation': {'lat': '-37.3159', 'long': '81.1496'}
        },
        'phone': '1-570-236-7033'
      };
      // parameters params = {
      //   "name": "Nicolas",
      //   "email": "nico@gmail.com",
      //   "password": "1234",
      //   "avatar": "https://picsum.photos/800",
      // };
      registerModel = await _authPro.register(params: rawData);

      return registerModel != null ? true : false;
    } catch (e) {
      print("error in register $e");
    }
    return false;
  }

  Future<bool> login() async {
    try {
      // parameters params = {"username": "mor_2314", "password": "83r5^_"};
      parameters params = {"username": "mor_2314", "password": "83r5^_"};
      loginModel = await _authPro.login(params: params);
      print("loginModel $loginModel");
      if (loginModel != null) {
        return true;
      }
    } catch (e) {
      print("error in register $e");
    }
    return false;
  }

  void changeIndex({required int index}) {
    selectedIndex = index;
    update();
  }
}
