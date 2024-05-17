
import 'package:aloudeh_company/features/admin/data/entity/log_in_admin_entity.dart';

class LogInAdminModel extends LogInAdminEntity{
  LogInAdminModel({required super.token});


  factory LogInAdminModel.fromEntity(LogInAdminEntity entity) {
    return LogInAdminModel(
      token: entity.token,
    );
  }

  LogInAdminEntity toEntity() {
    return LogInAdminEntity(
      token: token,
    );
  }

}