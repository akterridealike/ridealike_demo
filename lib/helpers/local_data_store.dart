import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StoredData {
  final FlutterSecureStorage _secureStorage =  FlutterSecureStorage();
   secureData(key ,value){
    _secureStorage.write(key:key, value: value);

  }
}