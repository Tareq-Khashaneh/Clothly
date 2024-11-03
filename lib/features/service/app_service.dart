

import 'package:get/get.dart';

import '../../networking/network_service.dart';

class AppService extends GetxService{
  late NetworkService networkService;

  Future<AppService> init()async{
    networkService = NetworkServiceDio();
    return this;
  }
  Future<void> initialize() async {
    await Get.putAsync(() => AppService().init());
  }
}