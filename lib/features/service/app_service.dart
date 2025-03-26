import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/features/auth/data/models/user_model.dart';
import 'package:get/get.dart';

import '../../core/constants/api_endpoint.dart';
import '../../networking/network_service.dart';

class AppService extends GetxService {
  late NetworkService networkService;
  UserModel? currentUser;
  String? logoImage;
  Future<AppService> init() async {
    networkService = NetworkServiceDio();
    await getLogo();
    return this;
  }

  Future<void> initialize() async {
    await Get.putAsync(() => AppService().init());
  }

  Future getLogo() async {
    try {
      dioRes response = await networkService.get(url: Api.settings);
      print("res $response");
      if (response.statusCode == 200) {
        logoImage = response.data['logo'];
      }
    } catch (e) {}
  }
}
