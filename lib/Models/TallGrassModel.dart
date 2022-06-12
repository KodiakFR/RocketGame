import 'package:cloud_firestore/cloud_firestore.dart';

class TallGrassModel {
  final int id;
  final String idTrapModel;
  final String nameTrapModel;
  final Timestamp catchTime;
  final String city;

  TallGrassModel(this.id, this.idTrapModel,this.nameTrapModel, this.catchTime, this.city);

  Map<String, dynamic> toJson() =>
      {'id': id, 'idTrapModel': idTrapModel,'nameTrapModel':nameTrapModel, 'catchTime': catchTime, 'city': city};

  factory TallGrassModel.fromJson(Map<String, dynamic> json) {
    return TallGrassModel(
      json['id'],
      json['idTrapModel'],
      json['nameTrapModel'],
      json['catchTime'],
      json['city'],
    );
  }
}
