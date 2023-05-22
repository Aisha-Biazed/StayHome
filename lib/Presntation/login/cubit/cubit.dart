import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/model/dio_helper.dart';

import '../../../model/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password})
  {
    print('loding');
emit(LoginLoadingState());
    DioHelper.postData(
      url: loginEndpoints,
      data: {'email': email, 'password': password},
    ).then((value) {
      print("Succful");
      print(value.data);
      emit(LoginSuccessState());
    }

    ).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
