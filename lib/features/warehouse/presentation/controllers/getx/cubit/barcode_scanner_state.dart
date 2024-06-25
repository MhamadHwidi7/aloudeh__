part of 'barcode_scanner_cubit.dart';

@freezed
class BarcodeScannerState with _$BarcodeScannerState {
  const factory BarcodeScannerState.initial() = _Initial;
  const factory BarcodeScannerState.scanning() = _Scanning;
  const factory BarcodeScannerState.success(Barcode barcode) = _Success;
  const factory BarcodeScannerState.error(String message) = _Error;
}
