import 'package:course/modules/shop_app/shop_login_screen/cupit/states.dart';
import 'package:course/shared/network/end_pionts.dart';
import 'package:course/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.PostData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(ShopLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;

  void ChangePasswordVisibility() {

    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
