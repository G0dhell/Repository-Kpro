import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginApiResponse {
  final String? token;
  final String? error;

  LoginApiResponse({this.token, this.error});
}

class ApiServicesRegister {
  Future<LoginApiResponse> apiCallRegister(Map<String, dynamic> param) async {
    var url = Uri.parse('https://staging.klasspro.id/wp-json/ms_lms/v1/registration');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["token"], error: data["error"]);
  }
}

class RegisterApiResponse {
  final String? token;
  final String? error;

  RegisterApiResponse({this.token, this.error});
}

class ApiServicesRestore {
  Future<LoginApiResponse> apiCallRestore(Map<String, dynamic> param) async {
    var url = Uri.parse('https://staging.klasspro.id/wp-json/ms_lms/v1/account/restore_password');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["token"], error: data["error"]);
  }
}

class RestoreApiResponse {
  final String? token;
  final String? error;

  RestoreApiResponse({this.token, this.error});
}

