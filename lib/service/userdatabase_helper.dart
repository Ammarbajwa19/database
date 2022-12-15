import 'package:database/model/user_model.dart';
import 'package:database/service/database_helper.dart';

class userdatbasehelper {
  static String tableName = 'User';
  static Future<void> createUser(UserModel user) async {
    var database = await databaseHelper.instance.database;
    await database!.insert(tableName, user.toMap());
  }

  static Future<List<UserModel>> getUsers() async {
    var database = await databaseHelper.instance.database;
    List<Map> list = await database!.rawQuery('Select * From $tableName');
    List<UserModel> users = [];
    for (var elemant in list) {
      var user = UserModel.fromMap(elemant);
      users.add(user);
    }
    return users;
  }

  static Future<void> updateUser(UserModel user) async {
    var database = await databaseHelper.instance.database;
    await database!.update(
      tableName,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<void> deleteUser(int id) async {
    var database = await databaseHelper.instance.database;
    await database!.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
