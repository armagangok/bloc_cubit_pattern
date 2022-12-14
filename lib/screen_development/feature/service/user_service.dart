import 'package:vexana/vexana.dart';

import '../../product/utils/network_route.dart';
import '../../product/utils/netwrok_query.dart';
import '../model/reqres_model.dart';
import 'i_user_service.dart';

class UserService extends IUserService {
  UserService(INetworkManager manager) : super(networkManager: manager);

  @override
  Future<List<Data>> fetchUserData({int page = 0}) async {
    final response = await networkManager.send<ReqresModel, ReqresModel>(
      NetworkRoute.USERS.rawValue,
      parseModel: ReqresModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([NetworkQuery.PAGE.pageQuery(page)]),
    );
    final reqResModel = response.data;
    if (reqResModel != null) {
      final dataList = reqResModel.data;
      if (dataList != null) {
        return dataList;
      }
    }

    return [];
  }
}
