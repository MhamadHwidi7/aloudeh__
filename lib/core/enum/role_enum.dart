import 'package:enhanced_enum/enhanced_enum.dart';
@EnhancedEnum(strict: false)
enum RoleEnum {
  @EnhancedEnumValue(name: 'admin')
  admin,
  @EnhancedEnumValue(name: 'branchmanager')
  branchManager,
  @EnhancedEnumValue(name: 'warehousemanager')
  warehouseManager,
   @EnhancedEnumValue(name: 'employee')
  employee,
  @EnhancedEnumValue(name: 'driver')
  driver,
  @EnhancedEnumValue(name: 'customer')
  customer,
}
