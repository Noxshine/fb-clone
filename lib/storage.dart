import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'models/User.dart';



const storage = FlutterSecureStorage();

// Save JWT to secure storage
// Future<void> saveUser(User user) async {
//   await storage.write(key: 'id', value: user.id.toString());
//   await storage.write(key: 'firstname', value: user.firstname ?? '');
//   await storage.write(key: 'lastname', value: user.lastname ?? '');
//   await storage.write(key: 'token', value: user.token);
//   await storage.write(key: 'avatar', value: user.avatar.toString());
//   await storage.write(key: 'active', value: user.active.toString());
//   await storage.write(key: 'coins', value: user.coins.toString());
// }

void saveUser(User user){
  storage.write(key: 'id', value: user.id.toString());
  storage.write(key: 'firstname', value: user.firstname ?? '');
  storage.write(key: 'lastname', value: user.lastname ?? '');
  storage.write(key: 'token', value: user.token);
  storage.write(key: 'avatar', value: user.avatar.toString());
  storage.write(key: 'active', value: user.active.toString());
  storage.write(key: 'coins', value: user.coins.toString());
}

// Retrieve JWT from secure storage
Future<String?> getJwt() async {
  return await storage.read(key: 'token');
}

Future<String?> getName() async {
  return await storage.read(key: 'firstname');
}

Future<String?> getCoin() async {
  return storage.read(key: 'coins');
}
