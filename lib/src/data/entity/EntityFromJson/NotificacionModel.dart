import 'package:seicu/src/data/entity/BaseEntity.dart';

class NotificacionList extends BaseEntity {
  int idNotificacion;
  String titulo;
  String detalle;
  String fechacreacion;

  NotificacionList(
      {this.idNotificacion,
      this.titulo,
      this.detalle,
      this.fechacreacion
  });

  fromJson(Map<String, dynamic> json) => new NotificacionList(
        idNotificacion: json["idNotificacion"],
        titulo: json["notificacion"],
        detalle: json["detalle"],
        fechacreacion: json["fecha_creacion"],
      );
}


