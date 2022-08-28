import 'package:bloc_pattern/screen_development/product/utils/network_route.dart';
import 'package:vexana/vexana.dart';

class AppConstant {
  AppConstant._();
  static final instance = AppConstant._();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: NetworkRoute.BASE_URL.rawValue),
    

  );
}
