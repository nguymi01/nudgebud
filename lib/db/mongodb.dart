import 'dart:developer';

import 'package:flutterdemo/db/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static var db, userCollection;
  static connect() async{
    db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);

    await userCollection.find().forEach((v) {
      print(v);
    });

  }
}