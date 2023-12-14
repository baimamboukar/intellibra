import 'dart:developer' as dev;

extension LogX on Object {
  void get log => dev.log(toString());
}
