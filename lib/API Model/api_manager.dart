import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/API%20Model/API%20Data/Request/LoginRequest.dart';
import 'package:e_commerce/API%20Model/API%20Data/Request/RegisterRequest.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/AddCartResponse.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/AddToWishlistResponse.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/GetCartResponse.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/GetWishlistResponse.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/LoginResponse.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/RegisterResponse.dart';
import 'package:e_commerce/API%20Model/api_constraints.dart';
import 'package:e_commerce/Home/HomeTab_ViewModel/Response/CategoryResponse.dart';
import 'package:e_commerce/Home/HomeTab_ViewModel/Response/ProductResponse.dart';
import 'package:e_commerce/data/Errors/errors.dart';
import 'package:e_commerce/data/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;

class ApiManager
{
  static Future<RegisterResponse> register(String name, String email,
      String password, String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.signUp);
      var registerRequest = RegisterRequest(
         email: email ,
         name:  name,
         password:  password,
         phone: phone ,
         rePassword: rePassword);
 try {
    var response = await http.post(url, body: registerRequest.toJson());
    var bodyString = response.body; //String
    var json = jsonDecode(bodyString); //json
    return RegisterResponse.fromJson(json);
    //  RegisterResponse.fromJson(jsonDecode(response.body));
 }
 catch(e)
      {
         throw e ;
      }
   }

  static Future<LoginResponse> Login(String email, String password) async {
    Uri url = Uri.https(ApiConstraints.baseUrl ,ApiConstraints.Login );
     LoginRequest loginRequest = LoginRequest(
       email: email ,
       password: password ,
     );
     try {
       var response = await http.post(url, body: loginRequest.toJson());
       var bodyString = response.body; //String
       var json = jsonDecode(bodyString); //json
       return LoginResponse.fromJson(json);
     }
     catch(e)
     {
       throw e;
     }

   }

  static Future<CategoryOrBrandResponse> getAllCategories() async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.categories);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllBrands() async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.brands);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts() async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.products);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return ProductResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<Either<Errors, AddCartResponse>> addToCart(
      String productId) async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.add_to_cart);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, AddToWishlistResponse>> addToWishlist(
      String productId) async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.add_to_wishList);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddToWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetCartResponse>> getCart() async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.add_to_cart);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetWishlistResponse>> getWishlist() async {
    Uri url = Uri.https(ApiConstraints.baseUrl, ApiConstraints.add_to_wishList);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getWishlistResponse = GetWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getWishlistResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetCartResponse>> deleteItemCart(
      String productId) async {
    Uri url = Uri.https(
        ApiConstraints.baseUrl, '${ApiConstraints.add_to_cart}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemFromCart = GetCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromCart);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromCart.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromCart.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetWishlistResponse>> deleteItemFromWishlist(
      String productId) async {
    Uri url = Uri.https(
        ApiConstraints.baseUrl, '${ApiConstraints.add_to_wishList}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemFromWishlist = GetWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromWishlist);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromWishlist.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromWishlist.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Errors, GetCartResponse>> updateCountInCart(
      String productId, int count) async {
    Uri url = Uri.https(
        ApiConstraints.baseUrl, '${ApiConstraints.add_to_cart}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': '$count'});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var updateCountInCartResponse = GetCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      } else {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}

//bloc => separates the ui from the logic
// business logic components  => mix of bloc and provider
// bloc => dart package              flutter_bloc=> flutter package
// ui  =>  bloc => data
//input => events  output=> states
//cubit  ui  =>  cubit => data

// bloc builder  => with every states the screen changes
// bloc listener => for navigation , snack bar , small actions and the whole screen doesn't change
// bloc selector =>
// bloc provider => to make function of bloc
// bloc consumer  => mix of builder and provider

//https://ecommerce.routemisr.com/api/v1/auth/signup
//Uri => universe source identifier
//authority => name of the server (base name)
//unencodedPath => name of the api that we'll call