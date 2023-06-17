import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/model/dio_helper.dart';

import '../../../model/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin({required String email, required String password})
  async {
    print('loding');
emit(LoginLoadingState());

      final String baseUrl = "http://stayhome22-001-site1.ftempurl.com/api/Mobile/Customer/LogIn";
      final Map<String, dynamic> body = {
        "email": "@gmaicustomerl.com",
        "password": "1234"
      }; // replace with your own body

      final dio = Dio();

      try {
        final response = await dio.post(
          baseUrl,
          options: Options(
            headers: {'Content-Type': 'application/json'}, // set header
          ),
          data: json.encode(body), // set body
        );

        if (response.statusCode == 200) {
          // handle success response
          final jsonResponse = json.decode(response.data);
          print(jsonResponse);
          print(response.statusCode);
          print("sadfffffffffffffffff");
        } else {
          // handle error response
          print('Request failed with status: ${response.statusCode}.');
        }
      } catch (e) {
        // handle error
        print(e.toString());
      }then((value) {
      print("Succful");
      print(value.statusCode);
      emit(LoginSuccessState());
    }

    ).catchError((error){
      print("errrrrrrrrrrrror");
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  then(Null Function(dynamic value) param0) {}
}
