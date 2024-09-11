import 'package:e_commerce/API%20Model/api_manager.dart';
import 'package:e_commerce/Home/HomeTab_ViewModel/Response/ProductResponse.dart';
import 'package:e_commerce/Home/Menu_tab/cubit/productStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewModel extends Cubit<ProductStates> {
  ProductViewModel() : super(ProductInitialState());

  //todo: hold data - handle logic
  List<Product>? productList;

  List<Product> cartItems = [];
  int numOfCartItem = 0;

  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProduct() async {
    try {
      emit(ProductLoadingState());
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail') {
        emit(ProductErrorState(errorMessage: response.message!));
      } else {
        productList = response.data ?? [];
        emit(ProductSuccessState(response: response));
      }
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  void addToCart(String productId) async {
    var either = await ApiManager.addToCart(productId);
    either.fold(
        (error) => emit(AddCartErrorState(errorMessage: error.toString())),
        (response) {
      numOfCartItem = response.numOfCartItems!.toInt();
      print(numOfCartItem.toInt());
      emit(AddCartSuccessState(cartResponse: response));
    });
  }

  bool isProductInCart(Product product) {
    return cartItems.contains(product);
  }
}
