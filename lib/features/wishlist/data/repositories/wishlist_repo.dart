

import 'dart:convert';

import 'package:clothly/core/constants/api_endpoint.dart';
import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/networking/network_service.dart';

class WishlistRepo {
  final  NetworkService _networkService ;

  WishlistRepo({required NetworkService networkService}) : _networkService = networkService;
  Future<List> getAllWishlistItems()async{
    try{
     dioRes response =  await _networkService.get(url: Api.wishlist);
     print("response $response");
      if(response.statusCode == 200){
       return response.data['data'];
      }
    }catch(e){
      print("error in wishlist repo ${e.toString()}");
    }
    return [];
  }
  Future<bool> removeProductFromWishlist({required String productId})async{
    try {
      dioRes response = await _networkService.delete(url: "${Api.wishlist}/$productId");
      print("response $response");
      if (response.statusCode == 200 && response.data['message'] == "wishlistItem removed from wishlist") {
        return true;
      }
    } catch (e) {
      print("error in ProductRepo categories for wishlistItem $e");
    }
    return false;
  }
}