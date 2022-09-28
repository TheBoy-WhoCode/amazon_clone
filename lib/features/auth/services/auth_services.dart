import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserModel userModel = UserModel(
        id: "",
        name: name,
        email: email,
        password: password,
        address: "",
        type: "",
        token: "",
      );

      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        body: userModel.toJson(),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(
                context, "Account created! Login with the same credentials.");
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
