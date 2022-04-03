import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//TODO method return types
class StoredData {
   FlutterSecureStorage secureStorage =  const FlutterSecureStorage();
   //TODO useless variable?
  static dynamic data;
  writeData(key ,value) async{
  await secureStorage.write(key:key, value: value);

  }

   readData(key)async{

    var _data=await secureStorage.readAll();
    data = _data;
    print(data);
  }
}