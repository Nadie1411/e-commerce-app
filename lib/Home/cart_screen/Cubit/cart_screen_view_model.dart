import 'package:e_commerce/API%20Model/API%20Data/Response/GetCartResponse.dart';
import 'package:e_commerce/API%20Model/api_manager.dart';
import 'package:e_commerce/Home/cart_screen/Cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenViewModel extends Cubit<CartStates> {
  CartScreenViewModel() : super(CartInitialState());

  //todo: hold data - handle logic

  List<GetProductCart> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await ApiManager.getCart();
    either.fold((l) => emit(GetCartErrorState(error: l)), (r) {
      productList = r.data!.products!;
      emit(GetCartSuccessState(response: r));
    });
  }

  void deleteItemFromCart(String productId) async {
    var either = await ApiManager.deleteItemCart(productId);
    either.fold((l) => emit(GetCartErrorState(error: l)), (r) {
      emit(GetCartSuccessState(response: r));
    });
  }

  void updateCountInCart(String productId, int count) async {
    var either = await ApiManager.updateCountInCart(productId, count);
    either.fold((l) => emit(UpdateCountInCartErrorState(error: l)), (r) {
      emit(GetCartSuccessState(response: r));
    });
  }
}
