part of 'repositories.dart';

class UserRepository {
  var callService = locator<CallService>();
  Future<User> getSingleUser(String idUser) async {
    try {
      final response = await callService.connect(
        '${Constant.singleUser}$idUser',
        {},
        Constant.get,
      );

      User userData = userFromJson(json.encode(response.data));
      return userData;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }

  Future<ListUser> getListUser(String page) async {
    try {
      final response = await callService.connect(
        '${Constant.listUser}$page',
        {},
        Constant.get,
      );

      ListUser userListData = listUserFromJson(json.encode(response.data));
      return userListData;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }

  Future<TokenUserResponse> loginUser(Map<String, dynamic> jsonSend) async {
    try {
      final response = await callService.connect(
        Constant.login,
        jsonSend,
        Constant.post,
      );

      TokenUserResponse token =
          tokenUserResponseFromJson(json.encode(response.data));

      Prefs.setToken(token.token);

      return token;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }

  Future<RegisterUserResponse> registerUser(
      Map<String, dynamic> jsonSend) async {
    try {
      final response = await callService.connect(
        Constant.register,
        jsonSend,
        Constant.post,
      );

      RegisterUserResponse data =
          registerUserResponseFromJson(json.encode(response.data));

      Prefs.setToken(data.token);

      return data;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }
}
