import 'package:mongo_dart/mongo_dart.dart';

class Judar {
  final ObjectId id;
  final String nombre;
  final String dorsal;
  final String equioi;

  const Judar(
      {required this.id,
      required this.nombre,
      required this.dorsal,
      required this.equioi});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'nombre': nombre,
      'dorsal': dorsal,
      'equioi': equioi,
    };
  }

  Judar.fromMap(Map<String, dynamic> map)
      : nombre = map['nombre'],
        id = map['_id'],
        dorsal = map['dorsal'],
        equioi = map['equioi'];
}
