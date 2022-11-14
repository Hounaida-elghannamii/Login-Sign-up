import 'package:mongo_dart/mongo_dart.dart';
import 'package:untitled/judar.dart';
import 'package:untitled/constates.dart';

class MongoDB {
  static var db, coleccionJudares;
  static conectar() async {
    db = await Db.create(CONEXION);
    await db.open();
    // insertar(db);
    coleccionJudares = db.collection(COLECCION);
  }

  static Future<String> insirt(Judar data) async {
    try {
      final result = await coleccionJudares.insertOne(data.toMap());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Wrong";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getJudares() async {
    try {
      final judares = await coleccionJudares.find().toList();
      return judares;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  static insertar(Judar judar) async {
    await coleccionJudares.insertAll([judar.toMap()]);
  }

  static actualizar(Judar judar) async {
    var j = await coleccionJudares.findOne({"_id": judar.id});
    j["nombre"] = judar.nombre;
    j["dorsal"] = judar.dorsal;
    j["equioi"] = judar.equioi;
    await coleccionJudares.save(j);
  }

  static eliminar(Judar judar) async {
    await coleccionJudares.remove(where.id(judar.id));
  }
}
