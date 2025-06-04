import 'package:dtc_harleys_app/http/logging.Interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

/*
URL base de acesso, a partir da qual sao chamadas as demais URls
*/
// em casa
// const String mainUrl = 'http://192.168.15.154:8080';
// via wifi celular
// const String mainUrl = 'http://192.168.43.8:8080';

// via Integrator
const String mainUrl = 'http://15.235.55.109:4507/hcslzWebAPI';

const String APP_VERSION = 'Versão 1.0.0';
