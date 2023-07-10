import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/data_remote/auth_repo.dart';
import 'package:stay_home/model/create_model.dart';
import 'package:stay_home/model/shope_model.dart';

import '../../../model/home_model.dart';
import '../../../model/profile_model.dart';

class InitialCubit extends Cubit<InitialStates> {
  late final AuthRepo _authRepo;
  InitialCubit() : super(LoginInitialState()) {
    _authRepo = AuthRepo();
  }

  static InitialCubit get(context) => BlocProvider.of(context);
  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    Either<String, String> result =
        await _authRepo.loginUser(email: email, password: password);
    result.fold((l) {
      emit(LoginErrorState());
      //show error
    }, (r) {
      emit(LoginSuccessState());
      //save user
    });
  }

  void createUser(
      {required String fullName,
      String? id,
      required String email,
      required String password,
      required String phoneNumber,
      required String birthdate,
      required String deviceToken,
      required BuildContext context,
      required String cityId,
      String? gender}) async {
    emit(CreateLoadingState());

    Either<String, CreateModel> result = await _authRepo.createUser(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      birthdate: birthdate,
      deviceToken: deviceToken,
      cityId: cityId,
      gender: gender!,
      id: id!,
      // gender: gender
    );

    result.fold((l) {
      emit(CreateErrorState());
      //show error
    }, (r) {
      emit(CreateSuccessState());
      Navigator.pushNamed(context, Routes.profilesRoute, arguments: r);
    });
  }

  void profileCubit() async {
    emit(ProfileLoadingState());
    Either<String, ProfileModel> result = await _authRepo.myProfile();
    result.fold((l) {
      emit(ProfileErrorState());
      //show error
    }, (r) {
      emit(ProfileSuccessState(r as ProfileModel));
      //save user
    });
  }

  void homeCubit() async {
    emit(HomeLoadingState());
    Either<String, List<HomeModel>> result = await _authRepo.getHome();
    result.fold((l) {
      emit(HomeErrorState());
      //show error
    }, (r) {
      emit(HomeSuccessState(r as List<HomeModel>));
      //save user
    });
  }

  void shopCubit() async {
    emit(ShopLoadingState());
    Either<String, List<ShopModel>> listShop = await _authRepo.getShop();
    listShop.fold((l) {
      emit(ShopErrorState());
      //show error
    }, (r) {
      emit(ShopSuccessState(r as List<ShopModel>));
      //save user
    });
  }
}

//http://stayhome22-001-site1.ftempurl.com/api/Mobile/Customer/Create?FullName=Joudi&Email=joudi%47wQbNPTDJp9hMYdvogK2hAUiHsGeiybwaWe36bwtRQ3UTpYV7YuZ8FV5j9nauFCWwcjM6dTzpL5s2N79Rp5unwdMvc8ZKUCityId=d024439e-9efc-4a4c-94de-50e05c4df267
