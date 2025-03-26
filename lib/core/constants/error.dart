// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import 'app_colors.dart';

abstract class Exceptions {
  static void getExceptionType(dio.DioException e){}
}

class DioExceptions implements Exceptions {
  @override
  static void getExceptionType(dio.DioException e) {
    switch (e.type) {
      case dio.DioExceptionType.connectionTimeout:
       // showSnackBar(e.message);
        break;
      case dio.DioExceptionType.receiveTimeout:
       // showSnackBar(e.message);
        break;
      case dio.DioExceptionType.sendTimeout:
       // showSnackBar(e.message);
        break;
      case dio.DioExceptionType.badCertificate:
       // showSnackBar(e.message);
        break;
      case dio.DioExceptionType.badResponse:
      // showSnackBar(e.message);
        break;
      case dio.DioExceptionType.cancel:
      //  showSnackBar(e.message);
        break;
      case dio.DioExceptionType.connectionError:
      //  showSnackBar(e.message);
        break;
      // TODO: Handle this case.
      case dio.DioExceptionType.unknown:
        showSnackBar(e.message);
        break;
      default:
        showSnackBar('حدث خطأ اثناء تحميل البيانات');
      // TODO: Handle this case.
    }
  }
}

void showSnackBar(String? message,{bool isFail = true,snackPosition =SnackPosition.TOP,Color fontColor = Colors.white,Color? color ,Duration? duration}) {
  Get.snackbar(
    '',
    message ?? "no error message",
    messageText: Padding(
      padding: const EdgeInsets.only(bottom: 20,),
      child: Text(message ?? 'no error message',
          style:
              TextStyle(fontSize: Get.size.height * 0.03, color: fontColor),
      textAlign: TextAlign.center,
      ),
    ),
    isDismissible: true,
    snackPosition: snackPosition,
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: isFail ? Colors.red : AppColors.kSecondColorGrey,
    // colorText: AppColors.kMainColorBlack2,
    duration: duration ??  const Duration(milliseconds: 3500),
    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    padding: const EdgeInsets.only(bottom: 10 ,left: 10.0,right: 10),
  );
}
// Future<AwesomeDialog> showDialogue(3
