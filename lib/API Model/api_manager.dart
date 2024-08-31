import 'dart:convert';

import 'package:e_commerce/API%20Model/API%20Data/Request/LoginRequest.dart';
import 'package:e_commerce/API%20Model/API%20Data/Request/RegisterRequest.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/LoginResponse.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/RegisterResponse.dart';
import 'package:e_commerce/API%20Model/api_constraints.dart';
import 'package:http/http.dart' as http;

class ApiManager
{
   //https://ecommerce.routemisr.com/api/v1/auth/signup
   //Uri => universe source identifier
   //authority => name of the server (base name)
   //unencodedPath => name of the api that we'll call


   static Future<RegisterResponse> register(String name , String email , String password , String rePassword , String phone)async
   {
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


   static Future<LoginResponse> Login(String email , String password)async
   {
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
