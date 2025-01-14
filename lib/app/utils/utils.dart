import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Utils{
  static Future<bool> check() async {
    var connectivityResult = await (InternetConnection().hasInternetAccess);

    return connectivityResult;
  }
}