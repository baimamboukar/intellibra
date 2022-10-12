import 'package:intellibra/src/services/firebase/firestore/user_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRiverpods {
  static final userServicesRiverpods = Provider<UserServices>(
    (ref) {
      return UserServices(ref.read);
    },
  );
}
