import 'package:seicu/src/data/entity/BaseEntity.dart';

class TramitesList extends BaseEntity {
  String id;
  String estado;
  String nombreEmisor;
  String cargoEmisor;
  String nombreReceptor;
  String cargoReceptor;
  String fechaEmision;
  String fechaRecepcion;
  String oficial;
  String proveido;
  String nombreDestinatario;
  String cargoDestinatario;
  String referencia;
  String dias;
  String nur;
  String deOficina;
  String aOficina;
  String accion;

  TramitesList(
      {this.id,
      this.estado,
      this.nombreEmisor,
      this.cargoEmisor,
      this.cargoReceptor,
      this.nombreReceptor,
      this.fechaEmision,
      this.fechaRecepcion,
      this.oficial,
      this.proveido,
      this.nombreDestinatario,
      this.cargoDestinatario,
      this.referencia,
      this.dias,
      this.nur,
      this.deOficina,
      this.aOficina,
      this.accion});

  fromJson(Map<String, dynamic> json) => new TramitesList(
        id: json["id"],
        estado: json["estado"],
        nombreEmisor: json["nombre_emisor"],
        nombreReceptor: json["nombre_receptor"],
        cargoReceptor: json["cargo_receptor"],
        fechaEmision: json["fecha_emision"],
        fechaRecepcion: json["fecha_recepcion"],
        oficial: json["oficial"],
        proveido: json["proveido"],
        nombreDestinatario: json["nombre_destinatario"],
        cargoDestinatario: json["cargo_destinatario"],
        referencia: json["referencia"],
        dias: json["dias"],
        nur: json["nur"],
        deOficina: json["de_oficina"],
        aOficina: json["a_oficina"],
        accion: json["accion"],
      );
}


class TiposTramitesList extends BaseEntity {
  String id;
  String descripcion;
  String observacion;



  TiposTramitesList(
      {this.id,
      this.descripcion,
      this.observacion,
    });

  fromJson(Map<String, dynamic> json) => new TiposTramitesList(
        id: json["id"],
        descripcion: json["descripcion"],
        observacion: json["observacion"],
      
      );
}