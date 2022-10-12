import 'package:intellibra/src/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class UserBox {
  static void add(UserModel user) {
    if (!(Hive.isBoxOpen('userBox'))) {
      Hive.openBox<UserModel>('userBox');
    }
    Hive.box('userBox').put(user.uid, user.toJson());
  }

  static UserModel? getUser(String uid) {
    if (!(Hive.isBoxOpen('userBox'))) {
      Hive.openBox<UserModel>('userBox');
    }
    final user = Hive.box('userBox').get(uid);

    return UserModel.fromJson(user);
  }
}
