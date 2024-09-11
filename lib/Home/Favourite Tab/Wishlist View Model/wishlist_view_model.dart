import 'package:e_commerce/API%20Model/API%20Data/Response/GetWishlistResponse.dart';
import 'package:e_commerce/API%20Model/api_manager.dart';
import 'package:e_commerce/Home/Favourite%20Tab/Wishlist%20View%20Model/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListViewModel extends Cubit<WishlistStates> {
  WishListViewModel() : super(WishlistInitialState());

  //todo: hold data - handle logic
  List<GetWishlistData> wishList = [];

  static WishListViewModel get(context) => BlocProvider.of(context);

  void getWishlistItems() async {
    emit(WishlistLoadingState());
    var either = await ApiManager.getWishlist();
    either.fold((error) => emit((WishlistErrorState(errors: error))),
        (response) {
      wishList = response.data!;
      emit(WishlistSuccuessState(response: response));
    });
  }

  void addToWishlist(String productId) async {
    var either = await ApiManager.addToWishlist(productId);
    either.fold((error) => emit(AddWishlistErrorState(errors: error)),
        (response) {
      emit(AddWishlistSuccuessState(response: response));
    });
  }

  void deleteItemFromWishlist(String productId) async {
    emit(DeleteWishlistLoadingState());

    var either = await ApiManager.deleteItemFromWishlist(productId);
    either.fold((l) => emit(DeleteWishlistErrorState(errors: l)), (r) {
      emit(WishlistSuccuessState(response: r));
    });
  }
}
