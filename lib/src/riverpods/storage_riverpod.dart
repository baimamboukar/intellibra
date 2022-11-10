
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intellibra/src/services/firebase/storage/storage_services.dart';

final storageProvider = Provider<StorageServices>((ref) {
  return StorageServices(ref.read);
});