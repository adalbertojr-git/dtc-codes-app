//import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:dtc_harleys_app/http/http.exception.dart';
import 'package:dtc_harleys_app/common/injection.dart';
import 'package:dtc_harleys_app/common/messages.dart';
import 'package:dtc_harleys_app/common/token.details.dart';
import 'package:dtc_harleys_app/components/centered.message.dart';
import 'package:dtc_harleys_app/components/degradee.background.dart';
import 'package:dtc_harleys_app/controllers/login.controller.dart';
import 'package:dtc_harleys_app/pages/dtc.code.dashboard.page.dart';

class Loading extends StatefulWidget {

  Loading();

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final LoginController _controller = LoginController();
  final String _pathFlareActor = 'assets/anims/splash.flr';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _callDashboard();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DegradeBackground(
        /*FlareActor(
          _pathFlareActor,
          isPaused: false,
          animation: 'animation-hc',
        ),*/
        CircularProgressIndicator(),
      );

  _callDashboard() async {
    try {
      final value = await _controller.authenticate(
        'gapsol',
        'G@psol09351010',
      );
      debugPrint(value.token);
      loadTokenSingleton(value);
      TokenDetails _tokenDetails = TokenDetails(value.token);
      debugPrint(_tokenDetails.expiryDate());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DtcCodeDashboardPage(),
        ),
      );
    } on HttpException catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CenteredMessage(
            title: ERROR,
            message: e.message.toString(),
          ),
        ),
      );
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CenteredMessage(
            title: ERROR,
            message: e.toString(),
          ),
        ),
      );
    }
  }
}

/*  void testToken() {
    String token =
        'eyJhbGciOiJIUzUxMiJ9.eyJhc3NvY2lhdGVkSWQiOjEsInN1YiI6ImF0YWpyIiwiZXhwIjoxNjEwNTg3NjUxLCJpYXQiOjE2MTA1Njk2NTF9.e8OIa6r6h4JuMJhxIilo3QO7LKGbCjlr32iyQWN4QnXW-2TFkwZSRvNbr6hwCVcbgP6bjjhpxI5pED3Qd608Wg';
    // To decode the token
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    // Print the payload
    print("payload: $payload");

    // Print one of its property(example: email):
    //print(payload['email']);

//   To get expiry date
    DateTime expiryDate = Jwt.getExpiryDate(token);
//   Print the expiry date
    print("expiryDate: $expiryDate");

    // To check if token is expired
    bool isExpired = Jwt.isExpired(token);
    print("isExpired: $isExpired");

    // Can be used for auth state
    if (!isExpired) {
      //   Token isn't expired
    } else {
      //   Token is expired
    }
  }*/
