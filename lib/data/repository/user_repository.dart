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
}
