part of 'barcode_scanner_list_cubit.dart';

@freezed
class BarcodeScannerListState with _$BarcodeScannerListState {
  const factory BarcodeScannerListState.initial() = _Initial;
  const factory BarcodeScannerListState.scanning() = _Scanning;
  const factory BarcodeScannerListState.success(Barcode barcode) = _Success;
  const factory BarcodeScannerListState.alreadyScanned(List<String> barcodes) = _AlreadyScanned;
  const factory BarcodeScannerListState.error(String message) = _Error;
  const factory BarcodeScannerListState.flashStatusChanged(bool isFlashOn) = _FlashStatusChanged;
  const factory BarcodeScannerListState.barcodeListUpdated(List<String> barcodes) = _BarcodeListUpdated;
}