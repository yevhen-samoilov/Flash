import 'package:flash/data/remote/models/login_model.dart';
import 'package:flash/data/remote/services/apis/apis.dart';
import 'package:flash/data/remote/services/apis/apis_status.dart';

class AuthService {
  static Future<String> getTokenLogin() async {
    final Object object = await Apis.login();
    if (object is Success) {
      final model = LoginModel.fromJson(object.response.toString());
      return model.data.token;
    }
    return '';
  }
}
