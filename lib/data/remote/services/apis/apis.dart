import 'package:flash/constants/url_constants.dart';
import 'package:flash/data/local/services/database_local.dart';
import 'package:flash/data/remote/services/apis/network_clients.dart';

class Apis {
  static Future<Object> login({String? m}) async {
    final auth = await DataBaseService.read('auth');
    final mnemonic = m ?? auth['mnemonic'];
    Object object = await NetworkClients.get(
        UrlConstants.apiWallet, '/v1/auth/login', (json) => json,
        parameters: {'mnemonic': mnemonic});
    return object;
  }
}
