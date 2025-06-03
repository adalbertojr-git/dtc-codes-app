import 'package:get_it/get_it.dart';
import 'package:dtc_harley_codes/models/token.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton<Token>(() => Token(token: ''));
}

loadTokenSingleton(Token token){
  locator.get<Token>().token = 'Bearer ' + token.token;
}