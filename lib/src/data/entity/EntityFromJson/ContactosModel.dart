import 'package:seicu/src/data/entity/BaseEntity.dart';

class ContactosList extends BaseEntity {
  String id;
  String contacto;
  String descripcion;
  String correo;
  String telefono;
  String ubicacion;
  String municipio;


  ContactosList(
      {this.id,
      this.contacto,
      this.descripcion,
      this.correo,
      this.telefono,
      this.ubicacion,
      this.municipio});

  fromJson(Map<String, dynamic> json) => new ContactosList(
        id: json["id"],
        contacto: json["contacto"],
        descripcion: json["descripcion"],
        correo: json["correo"],
        telefono: json["telefono"],
        ubicacion: json["ubicacion"],
        municipio: json["municipio"],
      );
}
