import 'package:aloudeh_company/features/admin/data/entity/register_admin_entity.dart';

class RegisterAdminModel extends RegisterAdminEntity{
  RegisterAdminModel({required super.token});


  factory RegisterAdminModel.fromEntity(RegisterAdminEntity entity) {
    return RegisterAdminModel(
      token: entity.token,
    );
  }

  RegisterAdminEntity toEntity() {
    return RegisterAdminEntity(
      token: token,
    );
  }

}