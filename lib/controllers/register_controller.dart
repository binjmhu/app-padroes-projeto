import 'dart:convert';

import 'package:app_padroes/components/register_dialog.dart';
import 'package:app_padroes/constants/api_constants.dart';
import 'package:app_padroes/constants/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Register extends GetxController {
  final Uri _url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerUrl);

  void registerUser(BuildContext context, nome, email, senha) async {
    var headers = {'Content-Type': 'application/json'};
    Map body = {
      'nome': nome.trim(),
      'email': email.trim(),
      'senha': senha.trim()
    };
    var res = await post(_url, body: jsonEncode(body), headers: headers);

    if (res.statusCode == 201) {
      // 201 = created
      Get.dialog(RegisterDialog(
        title: StringsConstants.allRight,
        message: StringsConstants.userCreated,
      ));
    } else {
      Get.dialog(
        RegisterDialog(
          title: StringsConstants.error,
          message: StringsConstants.errorMessage,
        ),
      );
    }
  }
}
