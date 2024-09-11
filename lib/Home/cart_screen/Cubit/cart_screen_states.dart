import 'package:e_commerce/API%20Model/API%20Data/Response/GetCartResponse.dart';
import 'package:e_commerce/data/Errors/errors.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Errors error;

  GetCartErrorState({required this.error});
}

class GetCartSuccessState extends CartStates {
  GetCartResponse response;

  GetCartSuccessState({required this.response});
}

class DeleteItemFromCartLoadingState extends CartStates {}

class DeleteItemFromCartErrorState extends CartStates {
  Errors error;

  DeleteItemFromCartErrorState({required this.error});
}

class DeleteItemFromCartSuccessState extends CartStates {
  GetCartResponse response;

  DeleteItemFromCartSuccessState({required this.response});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Errors error;

  UpdateCountInCartErrorState({required this.error});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponse response;

  UpdateCountInCartSuccessState({required this.response});
}
