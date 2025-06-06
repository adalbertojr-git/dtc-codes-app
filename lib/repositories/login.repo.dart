import 'dart:async';
import 'dart:convert';
import 'package:dtc_harleys_app/http/http.exception.dart';
import 'package:dtc_harleys_app/models/token.dart';
import 'package:http/http.dart';
import 'package:dtc_harleys_app/common/settings.dart';

const String _authUrl = '/authenticate';

class LoginRepo {
  Future<Token> authenticate(String username, String password) async {
    try {
      Map params = {"username": username, "password": password};
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _authUrl),
            headers: {
              'Content-type': 'application/json',
            },
            body: jsonEncode(
              params,
            ),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return Token.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }
}
